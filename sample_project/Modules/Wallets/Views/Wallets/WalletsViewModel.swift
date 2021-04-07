//
//  WalletsViewModel.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 05.04.2021.
//

import Foundation

protocol WalletsViewModel {
    var assetsTitle: String? { get }
    var transactionsTitle: String? { get }

    func observeAssets(_ observer: @escaping (ObserverValue<[WalletsItem]>) -> Void) -> Cancellable
    func observeTransactions(_ observer: @escaping (ObserverValue<[WalletsItem]>) -> Void) -> Cancellable
    
    func onEvent(_ event: WalletsEvent)
}
