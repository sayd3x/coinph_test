//
//  WalletsErrorRecordTableViewCell.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import UIKit

class WalletsErrorRecordTableViewCell: LayoutableTableViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        titleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        stackView.spacing = 5.0
        stackView.axis = .vertical
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
