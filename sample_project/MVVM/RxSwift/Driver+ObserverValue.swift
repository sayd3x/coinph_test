//
//  Driver+ObserverValue.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 10.04.2021.
//

import RxSwift
import RxCocoa

extension SharedSequence where Self.SharingStrategy == DriverSharingStrategy {
    func drive(_ observer: @escaping (ObserverValue<Element>) -> Void) -> Cancellable {
        return self.drive(
            onNext: { observer(.value($0)) },
            onCompleted: { observer(.done) }
        ).asCancellable()
    }
}
