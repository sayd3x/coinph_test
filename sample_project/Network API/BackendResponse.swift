//
//  ServerResponse.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import Foundation

struct BackendResponse<T: Decodable>: Decodable {
    var data: T?
    var errors: [BackendError]?
}
