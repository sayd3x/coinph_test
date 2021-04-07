//
//  BackendError+LocalizedError.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import Foundation

extension BackendError: LocalizedError {
    var errorDescription: String? {
        return self.message
    }
}
