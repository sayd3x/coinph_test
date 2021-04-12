//
//  BackendNetworkApi.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 12.04.2021.
//


import Foundation
import Moya

struct BackendNetworkApi {
    enum Target {
        case listAssets(page: Int, limit: Int? = nil)
        case listTransactions(page: Int, limit: Int? = nil)
    }

    let baseURL: URL
    let target: Target
}

extension BackendNetworkApi: TargetType {
    var path: String {
        switch target {
        case .listAssets:
            return "/wallets"
        case .listTransactions:
            return "/histories"
        }
    }
    
    var method: Moya.Method {
        switch target {
        case .listAssets:
            return .get
        case .listTransactions:
            return .get
        }
    }
    
    var task: Task {
        switch target {
        case .listAssets(let page, let limit):
            return .requestParameters(
                parameters: [
                    "page": page,
                    "limit": limit ?? 20
                ],
                encoding: URLEncoding.queryString)
        case .listTransactions(let page, let limit):
            return .requestParameters(
                parameters: [
                    "page": page,
                    "limit": limit ?? 20
                ],
                encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        return nil
    }

    var sampleData: Data {
        return Data()
    }
}
