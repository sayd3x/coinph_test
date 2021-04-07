//
//  LoadingScreenMainRoute+RootModuleRoutable.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import UIKit

extension LoadingScreenMainRoute where Self: BaseUIKitRouter<UIViewController> & RootModuleContext
{
    func showMainScreen() {
        guard let rootVC = self.viewController, let module = self.rootModule else {
            assertionFailure("Invalid router context")
            return
        }
        
        module.registerRootViewController(rootVC)
    }
}
