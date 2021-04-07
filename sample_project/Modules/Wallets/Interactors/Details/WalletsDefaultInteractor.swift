//
//  WalletsDefaultInteractor.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 08.04.2021.
//

import Foundation
import RxSwift

struct WalletsDefaultInteractor {
    let repository: WalletsRepository
    private let scheduler = SerialDispatchQueueScheduler(qos: .userInteractive)
    private let state = WalletsDefaultInteractorState()
}

extension WalletsDefaultInteractor: WalletsInteractor {
    func observeAssets(_ observer: @escaping (ObserverEvent<[WalletsAsset]>) -> Void) -> Cancellable {
        return state.cachedAssets.subscribe(observer)
    }
    
    func observeTransactions(_ observer: @escaping (ObserverEvent<[WalletsTransaction]>) -> Void) -> Cancellable {
        return state.cachedTransactions.subscribe(observer)
    }
    
    func fetchMoreAssets(_ callback: @escaping (Error?) -> Void) -> Cancellable {
        return state.assetsNextPage
            .observeOn(scheduler)
            .take(1)
            .withLatestFrom(state.assetsFetchInProgress) { currentPage, fetchInProgress -> Int in
                guard !fetchInProgress else {
                    throw WalletsInteractorError.fetchInProgress
                }
                return currentPage
            }
            .do(onNext: { _ in
                state.assetsFetchInProgress.onNext(true)
            }, onDispose: {
                state.assetsFetchInProgress.onNext(false)
            })
            .flatMapLatest{ currentPage in
                repository.listAssetsOnPage(currentPage).observeOn(scheduler)
            }
            .map{ assets -> [WalletsAsset] in
                guard !assets.isEmpty else {
                    throw WalletsInteractorError.noMoreElements
                }
                return assets
            }
            .withLatestFrom(state.cachedAssets) { newAssets, assets in
                assets + newAssets
            }
            .withLatestFrom(state.assetsNextPage) { newAssets, currentPage -> Void in
                state.cachedAssets.onNext(newAssets)
                state.assetsNextPage.onNext(currentPage + 1)
                return ()
            }
            .asSingle()
            .asCompletable()
            .subscribe(callback)
    }
    
    func fetchMoreTransactions(_ callback: @escaping (Error?) -> Void) -> Cancellable {
        return state.transactionsNextPage
            .observeOn(scheduler)
            .take(1)
            .withLatestFrom(state.transactionsFetchInProgress) { currentPage, fetchInProgress -> Int in
                guard !fetchInProgress else {
                    throw WalletsInteractorError.fetchInProgress
                }
                return currentPage
            }
            .do(onNext: { _ in
                state.transactionsFetchInProgress.onNext(true)
            }, onDispose: {
                state.transactionsFetchInProgress.onNext(false)
            })
            .flatMapLatest{ currentPage in
                repository.listTransactionsOnPage(currentPage).observeOn(scheduler)
            }
            .map{ items -> [WalletsTransaction] in
                guard !items.isEmpty else {
                    throw WalletsInteractorError.noMoreElements
                }
                return items
            }
            .withLatestFrom(state.cachedTransactions) { newItems, items in
                items + newItems
            }
            .withLatestFrom(state.transactionsNextPage) { newItems, currentPage -> Void in
                state.cachedTransactions.onNext(newItems)
                state.transactionsNextPage.onNext(currentPage + 1)
                return ()
            }
            .asSingle()
            .asCompletable()
            .subscribe(callback)
    }
}

fileprivate struct WalletsDefaultInteractorState {
    let cachedAssets = BehaviorSubject<[WalletsAsset]>(value: [])
    let assetsNextPage = BehaviorSubject<Int>(value: 0)
    let assetsFetchInProgress = BehaviorSubject<Bool>(value: false)
    
    let cachedTransactions = BehaviorSubject<[WalletsTransaction]>(value: [])
    let transactionsNextPage = BehaviorSubject<Int>(value: 0)
    let transactionsFetchInProgress = BehaviorSubject<Bool>(value: false)
}
