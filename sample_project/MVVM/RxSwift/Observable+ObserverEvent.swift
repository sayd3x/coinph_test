//
//  Observable+ObserverEvent.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 09.04.2021.
//

import RxSwift

extension Observable {
    func subscribe(_ observer: @escaping (ObserverEvent<Element>) -> Void) -> Cancellable {
        return self.subscribe { ev in
            observer(ev.asObserverEvent())
        }.asCancellable()
    }
}

extension PrimitiveSequence where Self.Trait == SingleTrait {
    func subscribe(_ observer: @escaping (Result<Element, Error>) -> Void) -> Cancellable {
        return self.subscribe { ev in
            observer(ev.asResult())
        }.asCancellable()
    }
}
