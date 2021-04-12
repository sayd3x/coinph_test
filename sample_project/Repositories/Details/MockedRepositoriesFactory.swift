//
//  MockedRepositoriesFactory.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 12.04.2021.
//

import Foundation
import Moya

struct MockedRepositoriesFactory {
    let baseURL: URL
}

extension MockedRepositoriesFactory: RepositoriesFactory {
    func createAssetsRepository() throws -> AssetsRepository {
        let provider = MoyaProvider<BackendNetworkApi>(stubClosure: MoyaProvider.delayedStub(2.0),
                                                       plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
        return AssetsDefaultRepository(provider: provider, baseURL: baseURL)
    }
    
    func createTransactionsRepository() throws -> TransactionsRepository {
        let provider = MoyaProvider<BackendNetworkApi>(stubClosure: MoyaProvider.delayedStub(2.0),
                                                       plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
        return TransactionsDefaultRepository(provider: provider, baseURL: baseURL)
    }
}
