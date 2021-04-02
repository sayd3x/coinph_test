//
//  CardListViewController.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 19.03.2021.
//

import UIKit
import Combine

class CardListViewController: PresentableViewController, Presentable {
    private var viewModel: CardListViewModel!
    
    func attachViewModel(_ viewModel: CardListViewModel) {
        self.viewModel = viewModel
    }
    
    override func bindViewModel() {
        // subscribe to model
        viewModel.items.sink { _ in
            
        }.store(in: &cancellables)        
    }
}
