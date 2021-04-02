//
//  NoRouterPresenter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 28.12.2020.
//

import Foundation

enum ViewModelBasePresenterError: Error {
    case noViewModel
}

class ViewModelBasePresenter<ViewModel>: ViewModelPresenter {
    func createViewModel() throws -> ViewModel {
        throw ViewModelBasePresenterError.noViewModel
    }
}
