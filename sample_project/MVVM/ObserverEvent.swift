//
//  ObserverEvent.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import Foundation

enum ObserverEvent<T> {
    case value(T)
    case error(Error)
    case done
}

