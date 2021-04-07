//
//  Event+ObserverEvent.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 08.04.2021.
//

import RxSwift

extension Event {
    func asObserverEvent() -> ObserverEvent<Element> {
        switch self {
        case .completed:
            return .done
        case .next(let element):
            return .value(element)
        case .error(let error):
            return .error(error)
        }
    }
}

extension ObserverEvent {
    func asRxEvent() -> Event<T> {
        switch self {
        case .done:
            return .completed
        case .error(let error):
            return .error(error)
        case .value(let value):
            return .next(value)
        }
    }
}

extension SingleEvent {
    func asResult() -> Result<Element, Error> {
        switch self {
        case .error(let error):
            return .failure(error)
        case .success(let value):
            return .success(value)
        }
    }
}

extension ObserverValue {
    func asRxEvent() -> Event<T> {
        switch self {
        case .done:
            return .completed
        case .value(let value):
            return .next(value)
        }
    }
}
