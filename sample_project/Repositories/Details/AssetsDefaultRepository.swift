//
//  AssetsDefaultRepository.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 12.04.2021.
//

import Foundation
import Moya
import RxMoya

struct AssetsDefaultRepository {
    let provider: MoyaProvider<BackendNetworkApi>
    let baseURL: URL
}

extension AssetsDefaultRepository: AssetsRepository {
    func listAssetsOnPage(_ page: Int, withLimit limit: Int, andCallback callback: @escaping (Result<[Asset], Error>) -> Void) -> Cancellable {
        
        let endpoint = BackendNetworkApi(baseURL: baseURL,
                                      target: .listAssets(page: page, limit: limit))

        return provider.rx.request(endpoint)
            .map{ try $0.asBackendResponse([Asset].self).value() }
            .subscribe(callback)
    }
}
