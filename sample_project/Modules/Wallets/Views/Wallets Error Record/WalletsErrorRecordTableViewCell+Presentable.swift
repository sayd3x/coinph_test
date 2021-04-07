//
//  WalletsErrorRecordTableViewCell+Presentable.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import UIKit

extension WalletsErrorRecordTableViewCell: Presentable {
    func attachViewModel(_ viewModel: WalletsErrorRecordViewModel) throws {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }
}
