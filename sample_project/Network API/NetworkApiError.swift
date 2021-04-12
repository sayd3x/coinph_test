//
//  NetworkApiError.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 12.04.2021.
//

import Foundation

enum NetworkApiError {
    case backendError([BackendError])
    case serverError
}

extension NetworkApiError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .backendError(let errors):
            return errors.compactMap{ $0.message }.joined(separator: "\n")
        case .serverError:
            return "Server error"
        }
    }
}
