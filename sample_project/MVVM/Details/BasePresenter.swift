//
//  BasePresenter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import Foundation

enum BasePresenterError: Error {
    case shouldCreateViewModel
}

class ViewModelBasePresenter<ViewModel>: ViewModelPresenter {
    func createViewModel() throws -> ViewModel {
        throw ViewModelBasePresenterError.noViewModel
    }
}

class BasePresenter<ViewModel, Router>: ViewModelBasePresenter<ViewModel> {
    private(set) var router: Router!
    
    func attachRouter(_ router: Router) throws {
        self.router = router
    }
}
