//
//  ServerError.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import Foundation

struct BackendError: Decodable {
    var code: String?
    var message: String?
}
