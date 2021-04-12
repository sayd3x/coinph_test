//
//  WalletsDefaultModule.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 11.04.2021.
//

import Foundation
import UIKit

struct WalletsDefaultModule {
    
}

extension WalletsDefaultModule: WalletsModule {
    
}

extension WalletsDefaultModule: RootUIModule, UIModule {
    func registerRootViewController(_ rootVC: UIViewController) {
        // replace view controller
        
        guard let window = rootVC.view.window else {
            return
        }
        
        do {
            // It's better to move viewcontroller's initialization part to the realted Configurator
            // but just left it here due to sample app
            
            let mockedRepositoryFactory = MockedRepositoriesFactory(baseURL: URL(string: "https://doesntmatter/")!)
            
            let moduleBridge = WalletsModuleBridge(assetsRepository: try mockedRepositoryFactory.createAssetsRepository(),
                                                   transactionsRepository: try mockedRepositoryFactory.createTransactionsRepository())
            
            let interactor = WalletsDefaultInteractor(repository: moduleBridge)
            let presenter = WalletsDefaultPresenter(interactor: interactor)
            
            let vc = WalletsViewController()
            try! vc.attachViewModel(presenter.createViewModel())
            window.rootViewController = vc
            window.makeKeyAndVisible()

        } catch {
            // handle errors here
            assertionFailure()
        }
    }
    
    func didReplaceRootViewController(_ rootVC: UIViewController?) {
        // ability to track rootViewController changes, but we don't need it for that sample app
    }
}
