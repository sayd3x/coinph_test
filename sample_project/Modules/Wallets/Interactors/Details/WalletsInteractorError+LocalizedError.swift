//
//  WalletsInteractorError+LocalizedError.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 10.04.2021.
//

import Foundation

extension WalletsInteractorError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .fetchInProgress:
            return nil
        case .noMoreElements:
            return "No more items"
        }
    }
}
