//
//  WalletsModuleBridge.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 10.04.2021.
//

import Foundation
import RxSwift

struct WalletsModuleBridge {
    let assetsRepository: AssetsRepository
    let transactionsRepository: TransactionsRepository
    let itemsPerPage = 20
}

extension WalletsModuleBridge: WalletsRepository {
    func listTransactionsOnPage(_ page: Int, andCallback callback: @escaping (Result<[WalletsTransaction], Error>) -> Void) -> Cancellable {
        return transactionsRepository.listTransactionsOnPage(page, withLimit: itemsPerPage)
            .map{ $0.map{ WalletsTransaction($0) } }
            .subscribe(callback)
    }
    
    func listAssetsOnPage(_ page: Int, andCallback callback: @escaping (Result<[WalletsAsset], Error>) -> Void) -> Cancellable {
        return assetsRepository.listAssetsOnPage(page, withLimit: itemsPerPage)
            .map{ $0.map{ WalletsAsset($0) } }
            .subscribe(callback)
    }
}
