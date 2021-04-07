//
//  ObserverValue.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 10.04.2021.
//

import Foundation

enum ObserverValue<T> {
    case value(T)
    case done
}
