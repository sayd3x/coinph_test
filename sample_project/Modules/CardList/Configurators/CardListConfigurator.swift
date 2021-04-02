//
//  CardListConfigurator.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 24.03.2021.
//

import Foundation

protocol CardListConfigurator {
    func configureCardListPresentable<T: Presentable>(_ presentable: T) where T.ViewModel == CardListViewModel
}

final class Configurator<T> {
    var router: T!
}

extension Configurator: CardListConfiguratorContext & CardListConfigurator where T == CardListRouter {
    var pageNumber: Int { 1 }
}

protocol CardListConfiguratorContext {
    var pageNumber: Int { get }
}

extension CardListConfigurator where Self: CardListConfiguratorContext {
    func configureCardListPresentable<T: Presentable>(_ presentable: T) where T.ViewModel == CardListViewModel {
        // 1. create a router
        let router = CardListRouter()

        // 2. create a viewmodel following by creating and seting up the presenter
        // probably the presenter requires some input argumets
        let presenter = CardListDefaultPresenter()
        try! presenter.attachRouter(router)
        let viewModel = try! presenter.createViewModel()

        try! presentable.attachViewModel(viewModel)
    }
}


func foo() {
    let configurator = Configurator<CardListRouter>()
    let vc = CardListViewController()
    configurator.configureCardListPresentable(vc)
    
    //configurator.con
}
