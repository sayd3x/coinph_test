//
//  WalletsInteractor+Rx.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 10.04.2021.
//

import RxSwift

extension WalletsInteractor {
    func observeAssets() -> Observable<[WalletsAsset]> {
        return Observable.create { observer -> Disposable in
            let cancel = self.observeAssets { observer.on($0.asRxEvent()) }
            return Disposables.create{
                cancel.cancel()
            }
        }
    }
    
    func fetchMoreAssets() -> Completable {
        return Completable.create { observer -> Disposable in
            let cancel = self.fetchMoreAssets { error in
                if let error = error {
                    observer(.error(error))
                } else {
                    observer(.completed)
                }
            }
            
            return Disposables.create {
                cancel.cancel()
            }
        }
    }
    
    func observeTransactions() -> Observable<[WalletsTransaction]> {
        return Observable.create { observer -> Disposable in
            let cancel = self.observeTransactions { observer.on($0.asRxEvent()) }
            return Disposables.create{
                cancel.cancel()
            }
        }
    }
    
    func fetchMoreTransactions() -> Completable {
        return Completable.create { observer -> Disposable in
            let cancel = self.fetchMoreTransactions { error in
                if let error = error {
                    observer(.error(error))
                } else {
                    observer(.completed)
                }
            }
            
            return Disposables.create {
                cancel.cancel()
            }
        }
    }
}
