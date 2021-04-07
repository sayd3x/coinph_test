//
//  WalletsViewModel+Rx.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 11.04.2021.
//

import Foundation
import RxSwift
import RxCocoa

extension WalletsViewModel {
    func observeAssets() -> Driver<[WalletsItem]> {
        return Observable<[WalletsItem]>.create { observer -> Disposable in
            let cancellable = self.observeAssets { event in
                observer.on(event.asRxEvent())
            }
            
            return Disposables.create {
                cancellable.cancel()
            }
        }.asDriver(onErrorJustReturn: [])
    }

    func observeTransactions() -> Driver<[WalletsItem]> {
        return Observable<[WalletsItem]>.create { observer -> Disposable in
            let cancellable = self.observeTransactions { event in
                observer.on(event.asRxEvent())
            }
            
            return Disposables.create {
                cancellable.cancel()
            }
        }.asDriver(onErrorJustReturn: [])
    }
}
