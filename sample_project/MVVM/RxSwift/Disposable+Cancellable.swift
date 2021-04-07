//
//  Disposable+Cancellable.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 09.04.2021.
//

import RxSwift

fileprivate struct Disposable2CancellableWrapper: Cancellable {
    let disposable: Disposable
    
    func cancel() {
        disposable.dispose()
    }
}

extension Disposable {
    func asCancellable() -> Cancellable {
        return Disposable2CancellableWrapper(disposable: self)
    }
}
