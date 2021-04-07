//
//  WalletsRecordTableViewCell+Presentable.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import UIKit

extension WalletsRecordTableViewCell: Presentable {
    func attachViewModel(_ viewModel: WalletsRecordViewModel) throws {
        leftTitleLabel.text = viewModel.leftTitle
        rightTitleLabel.text = viewModel.rightTitle
    }
}
