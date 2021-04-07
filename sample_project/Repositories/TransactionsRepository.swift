//
//  TransactionRepository.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 08.04.2021.
//

import Foundation

protocol TransactionsRepository {
    func listTransactionsOnPage(_ page: Int,
                                withLimit limit: Int,
                                andCallback callback: @escaping (Result<[Transaction],Error>) -> Void
    ) -> Cancellable
}
