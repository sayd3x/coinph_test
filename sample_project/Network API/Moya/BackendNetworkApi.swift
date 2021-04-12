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
        switch target {
        case .listAssets(page: 0, _):
            return "{\"data\":[{\"balance\":\"1000.23\",\"id\":\"1001\",\"wallet_name\":\"PHP\"},{\"balance\":\"100.10\",\"id\":\"1002\",\"wallet_name\":\"USD\"},{\"balance\":\"0.000000000000010026\",\"id\":\"1003\",\"wallet_name\":\"ETH\"}]}".data(using: .utf8)!
        case .listAssets(_, _):
            return "{\"errors\":{\"non_field_errors\":{\"code\":\"no_items\",\"message\":\"No more items\"}}}".data(using: .utf8)!
        case .listTransactions(page: 0, _):
            return "{\"data\":[{\"id\":\"2001\",\"entry\":\"incoming\",\"amount\":\"100.23\",\"currency\":\"PHP\",\"sender\":\"John\",\"recipient\":\"You\"},{\"id\":\"2000\",\"entry\":\"outgoing\",\"amount\":\"10.10\",\"currency\":\"USD\",\"sender\":\"You\",\"recipient\":\"7-11\"},{\"id\":\"1999\",\"entry\":\"incoming\",\"amount\":\"0.000000000000000105\",\"currency\":\"ETH\",\"sender\":\"Keith\",\"recipient\":\"You\"}]}".data(using: .utf8)!
        case .listTransactions(_, _):
            return "{\"errors\":{\"non_field_errors\":{\"code\":\"no_items\",\"message\":\"No more items\"}}}".data(using: .utf8)!
        }
    }
}
