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
    
    lazy var assetButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    lazy var transactionsButton: UIButton = {
        let button = UIButton()
        return button
    }()

    lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [assetButton, transactionsButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var assetsTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    lazy var transactionsTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    lazy var pageScroller: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.isDirectionalLockEnabled = true
        
        let scrollContent = UIStackView(arrangedSubviews: [assetsTableView, transactionsTableView])
        scrollView.addSubview(scrollContent)
        NSLayoutConstraint.activate([
            assetsTableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            transactionsTableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])

        return scrollView
    }()

}

extension WalletsViewController: Layoutable {
    var layoutableSubviews: [UIView] {
        return [topStackView, pageScroller]
    }
    
    var layoutableConstraints: [NSLayoutConstraint] {
        return [
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pageScroller.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
            pageScroller.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageScroller.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageScroller.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
    }
}

extension WalletsViewController: Presentable {
    func attachViewModel(_ viewModel: WalletsViewModel) throws {
        self.viewModel = viewModel
    }
}
