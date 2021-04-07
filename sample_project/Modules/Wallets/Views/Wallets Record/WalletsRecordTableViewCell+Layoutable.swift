//
//  WalletsRecordTableViewCell+Layoutable.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import UIKit

extension WalletsRecordTableViewCell: Layoutable {
    var layoutableSubviews: [UIView] {
        return [stackView]
    }
    
    var layoutableConstraints: [NSLayoutConstraint] {
        return stackViewConstraints
    }
}
