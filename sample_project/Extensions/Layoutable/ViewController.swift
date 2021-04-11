//
//  ViewController.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 11.04.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    // override it to do something after init()
    func setupSubviews() {}
}

class LayoutableViewController: ViewController {
    
    override func setupSubviews() {
        super.setupSubviews()
        
        if let layoutable = self as? Layoutable {
            layoutable.layoutableSubviews.forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
            
            NSLayoutConstraint.activate(layoutable.layoutableConstraints)
        }
    }
}
