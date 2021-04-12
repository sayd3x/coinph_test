//
//  Asset.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 08.04.2021.
//

import Foundation

struct Asset: Decodable, BackendData {
    var id: String
    var name: String?
    var balance: String?
    
    enum CodingKeys: String, CodingKey {
        case id,balance
        case name = "wallet_name"
    }
}
