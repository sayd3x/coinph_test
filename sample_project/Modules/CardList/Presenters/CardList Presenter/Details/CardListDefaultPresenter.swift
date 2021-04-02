//
//  CardListDefaultPresenter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 24.03.2021.
//

import Foundation
import Combine

extension AnyCancellable: Cancellable {}

fileprivate struct MasterSource {
    let items = CurrentValueSubject<[CardListItemViewModel], Never>([])
}

fileprivate struct CardListViewModelSource: CardListViewModel {
    var items: AnyPublisher<[CardListItemViewModel], Never>
    
    func observeItems(_ observer: @escaping ([CardListItemViewModel]) -> Void) -> Cancellable {
        return items.sink(receiveValue: observer)
    }
}

class CardListDefaultPresenter: BasePresenter<CardListViewModel, CardListRoutes> {
    private let masterSource = MasterSource()
    
    override func createViewModel() throws -> CardListViewModel {
        
        return CardListViewModelSource(
            items: masterSource.items.eraseToAnyPublisher()
        )
    }
}
