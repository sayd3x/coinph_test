//
//  Completable+Observer.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 09.04.2021.
//

import RxSwift

extension Completable {
    func subscribe(_ observer: @escaping (Error?) -> Void) -> Cancellable {
        return self.subscribe { ev in
            switch ev {
            case .completed:
                observer(nil)
            case .error(let error):
                observer(error)
            }
        }.asCancellable()
    }
}
