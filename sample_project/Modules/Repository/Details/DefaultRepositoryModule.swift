//
//  DefaultRepositoryModule.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import Foundation
import UIKit

class DefaultRepositoryModule {
    private var modules = [ObjectIdentifier:Module]()
    
    init() throws {
        self.modules = [
            // TODO: register necessary modules here
            ObjectIdentifier(WalletsModule.self): WalletsDefaultModule()
        ]
        
        try modules.values
            .compactMap{ $0 as? RepositoryModule }
            .forEach{
                try $0.didRegisterWithModulesRepository(WeakHolder(self))
            }
    }
}

extension DefaultRepositoryModule: Module {}

extension DefaultRepositoryModule: ModulesRepository {
    func getModule<T>(_ type:T.Type) -> T? {
        return modules[ObjectIdentifier(T.self)] as? T
    }
}

extension DefaultRepositoryModule: UIModule {
    
    func didReplaceRootViewController(_ rootVC: UIViewController?) {
        modules.values
            .compactMap{ $0 as? UIModule }
            .forEach{
                $0.didReplaceRootViewController(rootVC)
            }
    }
}

extension DefaultRepositoryModule: RootUIModule {
    func registerRootViewController(_ rootVC: UIViewController) {
        modules.values
            .compactMap{ $0 as? RootUIModule }
            .first?.registerRootViewController(rootVC)
    }
}

fileprivate struct WeakHolder {
    weak var host: DefaultRepositoryModule?
    
    init(_ host: DefaultRepositoryModule) {
        self.host = host
    }
}

extension WeakHolder: ModulesRepository {
    func getModule<T>(_ type: T.Type) -> T? {
        host?.getModule(type)
    }
}
