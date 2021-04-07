//
//  Response+BackendData.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import Foundation
import Moya

extension Response {
    func asBackendResponse<T: BackendData & Decodable>(_ type: T.Type) throws -> BackendResponse<T> {
        return try self.map(BackendResponse<T>.self)
    }
    
    func asBackendResponse<T: Sequence & Decodable>(_ type: T.Type) throws -> BackendResponse<T> where T.Element: BackendData {
        return try self.map(BackendResponse<T>.self)
    }
}
