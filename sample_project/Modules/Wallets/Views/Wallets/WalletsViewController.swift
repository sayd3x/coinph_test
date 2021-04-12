//
//  WalletsViewController.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import UIKit
import RxSwift
import RxCocoa

class WalletsViewController: LayoutableViewController {
    internal var viewModel: WalletsViewModel!
    internal var disposeBag = DisposeBag()
    
    lazy var assetButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("My Wallets", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addTarget(self, action: #selector(tappedAssetsButton(_:)), for: .touchUpInside)
        button.backgroundColor = .systemGray
        return button
    }()
    
    lazy var transactionsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("History", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addTarget(self, action: #selector(tappedTransactionsButton(_:)), for: .touchUpInside)
        return button
    }()
    
    internal var pageButtons: [UIButton] {
        [assetButton, transactionsButton]
    }
    
    lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [assetButton, transactionsButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var pageScroller: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        
        let scrollContent = UIStackView(arrangedSubviews: [assetsTableView, transactionsTableView])
        scrollContent.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(scrollContent)
        NSLayoutConstraint.activate([
            assetsTableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            transactionsTableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollContent.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            scrollContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        ])

        return scrollView
    }()
    
    lazy var assetsTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.layoutMargins.left = 24
        tableView.layoutMargins.right = 24
        tableView.separatorInset = .zero
        
        tableView.register(WalletsRecordTableViewCell.self)
        tableView.register(WalletsErrorRecordTableViewCell.self)
        tableView.register(WalletsLoadingTableViewCell.self)
        
        return tableView
    }()

    lazy var transactionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.estimatedRowHeight = 0
        tableView.layoutMargins.left = 24
        tableView.layoutMargins.right = 24
        tableView.separatorInset = .zero

        tableView.register(WalletsRecordTableViewCell.self)
        tableView.register(WalletsErrorRecordTableViewCell.self)
        tableView.register(WalletsLoadingTableViewCell.self)

        return tableView
    }()
    
    internal func activateTabWithPage(_ pageIndex: Int) {
        guard pageButtons.count > pageIndex else {
            return
        }
        
        pageButtons.forEach{
            $0.backgroundColor = nil
        }
        
        let currentPage = pageButtons[pageIndex]
        currentPage.backgroundColor = .systemGray
    }
    
    @objc func tappedAssetsButton(_ sender: Any) {
        pageScroller.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        activateTabWithPage(0)
    }
    
    @objc func tappedTransactionsButton(_ sender: Any) {
        pageScroller.setContentOffset(CGPoint(x: pageScroller.frame.width, y: 0), animated: true)
        activateTabWithPage(1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}

extension WalletsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item: WalletsItem = try! tableView.rx.model(at: indexPath)

        switch item {
        case .transaction(_, let model):
            return tableView.heightOf(WalletsRecordTableViewCell.self, forModel: model)
        case .asset(_, let model):
            return tableView.heightOf(WalletsRecordTableViewCell.self, forModel: model)
        case .error(let model):
            return tableView.heightOf(WalletsErrorRecordTableViewCell.self, forModel: model)
        case .loading:
            return 40
        case .fetchTrigger:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let item: WalletsItem = try! tableView.rx.model(at: indexPath)
        switch item {
        case .fetchTrigger:
            DispatchQueue.main.async { [self] in
                if tableView == assetsTableView {
                    viewModel.onEvent(.bare(.fetchMoreAssets))
                } else if tableView == transactionsTableView {
                    viewModel.onEvent(.bare(.fetchMoreTransactions))
                }
            }
            break
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
}
