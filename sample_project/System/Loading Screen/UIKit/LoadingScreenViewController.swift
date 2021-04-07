//
//  LoadingScreenViewController.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 22.12.2020.
//

import UIKit

class LoadingScreenViewController: UIViewController {
    var router: LoadingScreenMainRoute!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // perform a little delay to see loading screed
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [self] in
            router.showMainScreen()
        }
    }
}
