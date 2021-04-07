//
//  WalletsRepository.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import Foundation

protocol WalletsRepository {
    func listAssetsOnPage(_ page: Int,
                          andCallback callback: @escaping (Result<[WalletsAsset],Error>) -> Void
    ) -> Cancellable
    
    func listTransactionsOnPage(_ page: Int,
                                andCallback callback: @escaping (Result<[WalletsTransaction],Error>) -> Void
    ) -> Cancellable
}
