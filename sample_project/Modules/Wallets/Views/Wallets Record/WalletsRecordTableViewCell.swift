//
//  WalletsRecordTableViewCell.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 05.04.2021.
//

import UIKit

class WalletsRecordTableViewCell: LayoutableTableViewCell {
    internal lazy var leftTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    internal lazy var rightTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    internal lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [leftTitleLabel, rightTitleLabel])
        rightTitleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        stackView.axis = .horizontal
        return stackView
    }()

    internal var stackViewConstraints: [NSLayoutConstraint] {
        return [
            stackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor)
        ]
    }
}
