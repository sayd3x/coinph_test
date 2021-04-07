//
//  WalletsInteractor.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import Foundation

protocol WalletsInteractor {
    func observeAssets(_ observer: @escaping (ObserverEvent<[WalletsAsset]>) -> Void) -> Cancellable
    func fetchMoreAssets(_ callback: @escaping (Error?) -> Void) -> Cancellable

    func observeTransactions(_ observer: @escaping (ObserverEvent<[WalletsTransaction]>) -> Void) -> Cancellable
    func fetchMoreTransactions(_ callback: @escaping (Error?) -> Void) -> Cancellable
}
