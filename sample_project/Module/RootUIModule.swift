//
//  RootModule.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import UIKit

protocol RootUIModule {
    func didRegisterWithRootViewController(_ rootVC: UIViewController) throws
}
