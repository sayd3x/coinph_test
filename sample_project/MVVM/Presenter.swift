//
//  Presenter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import Foundation

protocol ViewModelPresenter {
    associatedtype ViewModel
    func createViewModel() throws -> ViewModel
}

protocol RoutablePresenter {
    associatedtype Router
    func attachRouter(_ router: Router) throws
}

typealias Presenter = ViewModelPresenter & RoutablePresenter
