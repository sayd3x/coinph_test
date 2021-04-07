//
//  WalletsTransactionFormatter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 10.04.2021.
//

import Foundation

protocol WalletsRecordTransactionFormatter {
    func transactionDescription(_ transaction: WalletsTransaction) -> String
    func transactionSpentAmount(_ transaction: WalletsTransaction) -> String
}
