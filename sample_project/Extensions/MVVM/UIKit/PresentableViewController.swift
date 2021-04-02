//
//  PresentableViewController.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 27.03.2021.
//

import UIKit
import Combine

class PresentableViewController: UIViewController {
    internal var cancellables = Set<AnyCancellable>()

    func bindViewModel() {}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cancellables.removeAll()
        bindViewModel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        cancellables.removeAll()
    }
}
