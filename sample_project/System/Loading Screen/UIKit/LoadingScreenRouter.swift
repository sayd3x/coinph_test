//
//  LoadingScreenRouter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import UIKit

final class LoadingScreenRouter: BaseUIKitRouter<UIViewController>,
                                 RootModuleContext,
                                 LoadingScreenMainRoute
{
    var rootModule: (RootUIModule & UIModule)? = nil
    
}
