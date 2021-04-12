//
//  TransactionsDefaultRepository.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 12.04.2021.
//

import Foundation
import Moya
import RxMoya

struct TransactionsDefaultRepository {
    let provider: MoyaProvider<BackendNetworkApi>
    let baseURL: URL
}

extension TransactionsDefaultRepository: TransactionsRepository {
    func listTransactionsOnPage(_ page: Int,
                                withLimit limit: Int,
                                andCallback callback: @escaping (Result<[Transaction],Error>) -> Void
    ) -> Cancellable {
        let endpoint = BackendNetworkApi(baseURL: baseURL,
                                      target: .listTransactions(page: page, limit: limit))

        return provider.rx.request(endpoint)
            .map{ try $0.asBackendResponse([Transaction].self).value() }
            .subscribe(callback)
    }
}
