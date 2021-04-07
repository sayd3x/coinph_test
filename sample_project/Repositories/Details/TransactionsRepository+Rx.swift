//
//  TransactionsRepository+Rx.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 11.04.2021.
//

import RxSwift

extension TransactionsRepository {
    func listTransactionsOnPage(_ page: Int, withLimit limit: Int) -> Single<[Transaction]> {
        return Single.create { observer -> Disposable in
            let cancellable = self.listTransactionsOnPage(page, withLimit: limit) { result in
                switch result {
                case .success(let value):
                    observer(.success(value))
                case .failure(let error):
                    observer(.error(error))
                }
            }
            
            return Disposables.create {
                cancellable.cancel()
            }
        }
    }
}
