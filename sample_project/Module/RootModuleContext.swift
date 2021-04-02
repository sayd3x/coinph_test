//
//  RootModuleContext.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 29.03.2021.
//

import Foundation

protocol RootModuleContext {
    var rootModule: (UIModule & RootUIModule)? { get }
}
