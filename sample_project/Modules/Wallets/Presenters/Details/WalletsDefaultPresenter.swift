//
//  WalletsDefaultPresenter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 10.04.2021.
//

import Foundation
import RxSwift
import RxCocoa

struct WalletsDefaultPresenter {
    let interactor: WalletsInteractor
}

extension WalletsDefaultPresenter: ViewModelPresenter {
    
    private func configureAssetsLogic(masterSource: MasterSource, disposeBag: DisposeBag) {
        let assetItems = interactor.observeAssets()
            .map{
                $0.filter{ $0.id != nil }.map{
                    WalletsItem.asset($0.id!, WalletsRecordViewModelSource($0, formatter: WalletsRecordAssetDefaultFormatter()))
                }
            }
        
        Observable.combineLatest(assetItems, masterSource.assetsLastItem)
            .map{ assetItems, assetLastItem in
                assetItems + (assetLastItem.map{ [$0] } ?? [])
            }
            .bind(to: masterSource.assets)
            .disposed(by: disposeBag)
        
        masterSource.event
            .filter{ $0.bare == .fetchMoreAssets }
            .do(onNext: { _ in
                masterSource.assetsLastItem.onNext(.loading)
            })
            .flatMapLatest{ _ in
                interactor.fetchMoreAssets()
                    .asObservable()
                    .materialize()
                    .map{ $0.error }
            }
            .map{ fetchError -> WalletsItem? in
                fetchError.map{ WalletsItem.error(WalletsErrorRecordViewModelSource($0)) }
            }
            .bind(to: masterSource.assetsLastItem)
            .disposed(by: disposeBag)
            
        masterSource.event
            .filter{ $0.selectedAssetItem?.isErrorItem ?? false }
            .map{ _ in WalletsEvent.bare(.fetchMoreAssets) }
            .bind(to: masterSource.event)
            .disposed(by: disposeBag)
    }
    
    private func configureTransactionsLogic(masterSource: MasterSource, disposeBag: DisposeBag) {
        let transactionItems = interactor.observeTransactions()
            .map{
                $0.filter{ $0.id != nil }.map{
                    WalletsItem.transaction($0.id!, WalletsRecordViewModelSource($0, formatter: WalletsRecordTransactionDefaultFormatter()))
                }
            }
        
        Observable.combineLatest(transactionItems, masterSource.transactionsLastItem)
            .map{ transactionItems, transactionsLastItem in
                transactionItems + (transactionsLastItem.map{ [$0] } ?? [])
            }
            .bind(to: masterSource.transactions)
            .disposed(by: disposeBag)
        
        masterSource.event
            .filter{ $0.bare == .fetchMoreTransactions }
            .do(onNext: { _ in
                masterSource.transactionsLastItem.onNext(.loading)
            })
            .flatMapLatest{ _ in
                interactor.fetchMoreTransactions()
                    .asObservable()
                    .materialize()
                    .map{ $0.error }
            }
            .map{ fetchError -> WalletsItem? in
                fetchError.map{ WalletsItem.error(WalletsErrorRecordViewModelSource($0)) }
            }
            .bind(to: masterSource.transactionsLastItem)
            .disposed(by: disposeBag)
            
        masterSource.event
            .filter{ $0.selectedTransactionItem?.isErrorItem ?? false }
            .map{ _ in WalletsEvent.bare(.fetchMoreTransactions) }
            .bind(to: masterSource.event)
            .disposed(by: disposeBag)
    }
    
    func createViewModel() throws -> WalletsViewModel {
        let disposeBag = DisposeBag()
        let masterSource = MasterSource()
        
        configureAssetsLogic(masterSource: masterSource,
                             disposeBag: disposeBag)
        
        configureTransactionsLogic(masterSource: masterSource,
                                   disposeBag: disposeBag)

        return WalletsViewModelSource(
            disposeBag: disposeBag,
            assetsTitle: "My Wallets",
            transactionsTitle: "History",
            assets: masterSource.assets.asDriver(onErrorJustReturn: []),
            transactions: masterSource.transactions.asDriver(onErrorJustReturn: []),
            event: masterSource.event
        )
    }
    
}

fileprivate struct MasterSource {
    let assets = BehaviorSubject<[WalletsItem]>(value: [])
    let assetsLastItem = BehaviorSubject<WalletsItem?>(value: nil)

    let transactions = BehaviorSubject<[WalletsItem]>(value: [])
    let transactionsLastItem = BehaviorSubject<WalletsItem?>(value: nil)
    
    let event = PublishRelay<WalletsEvent>()
}

fileprivate struct WalletsViewModelSource: WalletsViewModel {
    let disposeBag: DisposeBag
    let assetsTitle: String?
    let transactionsTitle: String?
    let assets: Driver<[WalletsItem]>
    let transactions: Driver<[WalletsItem]>
    let event: PublishRelay<WalletsEvent>

    func observeAssets(_ observer: @escaping (ObserverValue<[WalletsItem]>) -> Void) -> Cancellable {
        return assets.drive(observer)
    }
    
    func observeTransactions(_ observer: @escaping (ObserverValue<[WalletsItem]>) -> Void) -> Cancellable {
        return transactions.drive(observer)
    }
    
    func onEvent(_ event: WalletsEvent) {
        self.event.accept(event)
    }
}
