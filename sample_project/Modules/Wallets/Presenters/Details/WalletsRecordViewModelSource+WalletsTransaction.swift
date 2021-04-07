//
//  WalletsRecordViewModelSource+WalletsTransaction.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 10.04.2021.
//

import Foundation

extension WalletsRecordViewModelSource {
    init(_ transaction: WalletsTransaction, formatter: WalletsRecordTransactionFormatter) {
        self.init(leftTitle: formatter.transactionDescription(transaction),
                  rightTitle: formatter.transactionSpentAmount(transaction))
    }
}
