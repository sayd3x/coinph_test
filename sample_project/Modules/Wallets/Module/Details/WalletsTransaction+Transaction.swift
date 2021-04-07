//
//  WalletsTransaction+Transaction.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 09.04.2021.
//

import Foundation

extension WalletsTransaction {
    init(_ transaction: Transaction) {
        self.init(id: transaction.id,
                  direction: transaction.entry.map{ WalletsTransactionDirection(rawValue: $0) } ?? nil,
                  currency: transaction.currency,
                  sender: transaction.sender,
                  recipient: transaction.recipient)
    }
}
