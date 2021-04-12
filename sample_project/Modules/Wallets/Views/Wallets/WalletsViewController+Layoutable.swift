//
//  WalletsViewController+Layoutable.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 12.04.2021.
//

import UIKit

extension WalletsViewController: Layoutable {
    var layoutableSubviews: [UIView] {
        return [topStackView, pageScroller]
    }
    
    var layoutableConstraints: [NSLayoutConstraint] {
        return [
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pageScroller.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
            pageScroller.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageScroller.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageScroller.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
    }
}
