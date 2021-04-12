//
//  RepositoriesFactory.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 12.04.2021.
//

import Foundation

protocol RepositoriesFactory {
    func createAssetsRepository() throws -> AssetsRepository
    func createTransactionsRepository() throws -> TransactionsRepository
}
