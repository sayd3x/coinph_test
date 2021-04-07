//
//  WalletsEvent.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 10.04.2021.
//

import Foundation

enum WalletsEvent {
    enum Bare {
        case fetchMoreAssets
        case fetchMoreTransactions
    }
    
    case selectedAssetItem(WalletsItem)
    case selectedTransactionItem(WalletsItem)
    case bare(Bare)
}

extension WalletsEvent {
    var bare: Bare? {
        switch self {
        case .bare(let value):
            return value
        default:
            return nil
        }
    }
    
    var selectedAssetItem: WalletsItem? {
        switch self {
        case .selectedAssetItem(let value):
            return value
        default:
            return nil
        }
    }
    
    var selectedTransactionItem: WalletsItem? {
        switch self {
        case .selectedTransactionItem(let value):
            return value
        default:
            return nil
        }
    }
}
