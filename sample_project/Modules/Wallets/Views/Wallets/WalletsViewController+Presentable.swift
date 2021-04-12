//
//  WalletsViewController+Presentable.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 12.04.2021.
//

import UIKit
import RxSwift
import RxCocoa

extension WalletsViewController: Presentable {
    
    private func configureAssetsTableView(_ viewModel: WalletsViewModel) {
        viewModel.observeAssets()
            .drive(assetsTableView.rx.items) { (tableView, row, element) in
                switch element {
                case .asset(_, let model):
                    let cell = tableView.dequeueReusableCell(WalletsRecordTableViewCell.self,
                                                             forIndexPath: IndexPath(row: row, section: 0))
                    try! cell.attachViewModel(model)
                    return cell
                case .transaction(_, let model):
                    let cell = tableView.dequeueReusableCell(WalletsRecordTableViewCell.self,
                                                             forIndexPath: IndexPath(row: row, section: 0))
                    try! cell.attachViewModel(model)
                    return cell
                case .error(let model):
                    let cell = tableView.dequeueReusableCell(WalletsErrorRecordTableViewCell.self,
                                                             forIndexPath: IndexPath(row: row, section: 0))
                    try! cell.attachViewModel(model)
                    return cell
                case .loading:
                    return UITableViewCell()
                }
            }
            .disposed(by: disposeBag)
        
        Driver.zip(assetsTableView.rx.itemSelected.asDriver(),
                   assetsTableView.rx.modelSelected(WalletsItem.self).asDriver())
            .drive(onNext: { [unowned self] index, item in
                assetsTableView.deselectRow(at: index, animated: false)
                viewModel.onEvent(.selectedAssetItem(item))
            })
            .disposed(by: disposeBag)
    }

    private func configureTransactionsTableView(_ viewModel: WalletsViewModel) {
        viewModel.observeTransactions()
            .drive(transactionsTableView.rx.items) { (tableView, row, element) in
                switch element {
                case .asset(_, let model):
                    let cell = tableView.dequeueReusableCell(WalletsRecordTableViewCell.self,
                                                             forIndexPath: IndexPath(row: row, section: 0))
                    try! cell.attachViewModel(model)
                    return cell
                case .transaction(_, let model):
                    let cell = tableView.dequeueReusableCell(WalletsRecordTableViewCell.self,
                                                             forIndexPath: IndexPath(row: row, section: 0))
                    try! cell.attachViewModel(model)
                    return cell
                case .error(let model):
                    let cell = tableView.dequeueReusableCell(WalletsErrorRecordTableViewCell.self,
                                                             forIndexPath: IndexPath(row: row, section: 0))
                    try! cell.attachViewModel(model)
                    return cell
                case .loading:
                    return UITableViewCell()
                }
            }
            .disposed(by: disposeBag)
        
        Driver.zip(transactionsTableView.rx.itemSelected.asDriver(),
                   transactionsTableView.rx.modelSelected(WalletsItem.self).asDriver())
            .drive(onNext: { [unowned self] index, item in
                transactionsTableView.deselectRow(at: index, animated: false)
                viewModel.onEvent(.selectedAssetItem(item))
            })
            .disposed(by: disposeBag)
    }

    func attachViewModel(_ viewModel: WalletsViewModel) throws {
        disposeBag = DisposeBag()
        self.viewModel = viewModel
        
        configureAssetsTableView(viewModel)
        configureTransactionsTableView(viewModel)
    }
}
