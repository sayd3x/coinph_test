//
//  Transaction.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 08.04.2021.
//

import Foundation

struct Transaction: Decodable, BackendData {
    var id: String
    var entry: String?
    var amount: String?
    var currency: String?
    var sender: String?
    var recipient: String?
}
