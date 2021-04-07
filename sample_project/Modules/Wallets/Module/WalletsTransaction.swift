//
//  WalletsTransaction.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import Foundation

struct WalletsTransaction {
    var id: String?
    var direction: WalletsTransactionDirection?
    var currency: String?
    var amount: Decimal?
    var sender: String?
    var recipient: String?
}
