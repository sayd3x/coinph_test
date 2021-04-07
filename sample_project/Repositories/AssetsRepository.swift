//
//  AssetsRepository.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 08.04.2021.
//

import Foundation

protocol AssetsRepository {
    func listAssetsOnPage(_ page: Int,
                          withLimit limit: Int,
                          andCallback callback: @escaping (Result<[Asset],Error>) -> Void
    ) -> Cancellable
}
