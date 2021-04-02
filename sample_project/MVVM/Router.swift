//
//  Router.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import Foundation

protocol Router {}

protocol UIKitRouter: Router {
    associatedtype ViewController
    var viewController: ViewController? { get }
}
