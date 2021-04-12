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
        let button = UIButton(type: .roundedRect)
        button.setTitle("My Wallets", for: .normal)
        return button
    }()
    
    lazy var transactionsButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("History", for: .normal)
        return button
    }()

    lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [assetButton, transactionsButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var pageScroller: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        
        let scrollContent = UIStackView(arrangedSubviews: [assetsTableView, transactionsTableView])
        scrollContent.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(scrollContent)
        NSLayoutConstraint.activate([
            assetsTableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            transactionsTableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollContent.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
        ])

        return scrollView
    }()
    
    lazy var assetsTableView: UITableView = {
        let tableView = UITableView()
        tableView.layoutMargins.left = 24
        tableView.layoutMargins.right = 24
        tableView.backgroundColor = .green
        
        tableView.register(WalletsRecordTableViewCell.self)
        tableView.register(WalletsErrorRecordTableViewCell.self)

        return tableView
    }()

    lazy var transactionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.layoutMargins.left = 24
        tableView.layoutMargins.right = 24
        tableView.backgroundColor = .orange

        tableView.register(WalletsRecordTableViewCell.self)
        tableView.register(WalletsErrorRecordTableViewCell.self)

        return tableView
    }()
}
