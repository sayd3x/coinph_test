//
//  WalletsRecordTransactionDefaultFormatter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 10.04.2021.
//

import Foundation

struct WalletsRecordTransactionDefaultFormatter: WalletsRecordTransactionFormatter {
    func transactionDescription(_ transaction: WalletsTransaction) -> String {
        guard let direction = transaction.direction,
              let recipient = transaction.recipient,
              let sender = transaction.sender else {
            return ""
        }
        
        switch direction {
        case .incoming:
            return String(format: "%@'ve received payment", recipient)
        case .outgoing:
            return String(format: "%@'ve cashed out to %@", recipient, sender)
        }
    }
    
    func transactionSpentAmount(_ transaction: WalletsTransaction) -> String {
        var formattedString = transaction.direction == .outgoing ? "-" : ""
        
        if let amount = transaction.amount {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencySymbol = ""
            
            formattedString += formatter.string(for: amount as NSDecimalNumber) ?? ""
        }
        
        if let currency = transaction.currency {
            formattedString += " \(currency)"
        }
        
        return formattedString
    }
}
