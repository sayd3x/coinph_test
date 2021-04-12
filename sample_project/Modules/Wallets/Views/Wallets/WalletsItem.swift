//
//  WalletsItem.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 05.04.2021.
//

import Foundation

enum WalletsItem {
    case asset(_ id: String, _ model: WalletsRecordViewModel)
    case transaction(_ id: String, _ model: WalletsRecordViewModel)
    case error(_ model: WalletsErrorRecordViewModel)
    case loading
    case fetchTrigger
}

extension WalletsItem {
    var assetId: String? {
        switch self {
        case .asset(let id, _):
            return id
        default:
            return nil
        }
    }
    
    var transactionId: String? {
        switch self {
        case .transaction(let id, _):
            return id
        default:
            return nil
        }
    }
    
    var isErrorItem: Bool {
        switch self {
        case .error:
            return true
        default:
            return false
        }
    }
}
