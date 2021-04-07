//
//  WalletsRepository+Rx.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 09.04.2021.
//

import RxSwift

extension WalletsRepository {
    func listAssetsOnPage(_ page: Int) -> Single<[WalletsAsset]> {
        return Single.create { observer -> Disposable in
            let cancel = self.listAssetsOnPage(page) { result in
                switch result {
                case .failure(let error):
                    observer(.error(error))
                case .success(let value):
                    observer(.success(value))
                }
            }
            
            return Disposables.create {
                cancel.cancel()
            }
        }
    }
    
    func listTransactionsOnPage(_ page: Int) -> Single<[WalletsTransaction]> {
        return Single.create { observer -> Disposable in
            let cancel = self.listTransactionsOnPage(page) { result in
                switch result {
                case .failure(let error):
                    observer(.error(error))
                case .success(let value):
                    observer(.success(value))
                }
            }
            
            return Disposables.create {
                cancel.cancel()
            }
        }
    }
}
