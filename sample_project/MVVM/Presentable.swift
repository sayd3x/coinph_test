//
//  Presentable.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import Foundation

protocol Presentable {
    associatedtype ViewModel
    
    func attachViewModel(_ viewModel: ViewModel) throws
}
