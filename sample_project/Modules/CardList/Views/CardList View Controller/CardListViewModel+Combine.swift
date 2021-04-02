//
//  CardListViewModel+Combine.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 26.03.2021.
//

import Foundation
import Combine

extension CardListViewModel {
    var items: AnyPublisher<[CardListItemViewModel], Never> {
        return Deferred { () -> AnyPublisher<[CardListItemViewModel], Never> in
            let subject = PassthroughSubject<[CardListItemViewModel], Never>()

            let cancellable = self.observeItems { items in
                subject.send(items)
            }
            
            return subject.handleEvents(receiveCancel: {
                cancellable.cancel()
            }).eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
}
