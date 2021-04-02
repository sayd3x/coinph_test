//
//  BaseUIKitRouter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import UIKit

class BaseUIKitRouter<ViewController: UIViewController>: UIKitRouter {
    private(set) weak var viewController: ViewController?

    func setViewController(_ controller: ViewController?) {
        viewController = controller
    }
}
