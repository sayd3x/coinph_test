//
//  WalletsRecordTableViewCell.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 12.04.2021.
//

import UIKit

class WalletsLoadingTableViewCell: LayoutableTableViewCell {
    lazy var activityView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        return activity
    }()
    
    func showProgress() {
        activityView.startAnimating()
    }
}

extension WalletsLoadingTableViewCell: Layoutable {
    var layoutableSubviews: [UIView] {
        return [activityView]
    }
    
    var layoutableConstraints: [NSLayoutConstraint] {
        return [
            activityView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            activityView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ]
    }
}
