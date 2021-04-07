//
//  WalletsRecordViewModelSource+WalletsAsset.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 10.04.2021.
//

import Foundation

extension WalletsRecordViewModelSource {
    init(_ asset: WalletsAsset, formatter: WalletsRecordAssetFormatter) {
        self.init(leftTitle: formatter.assetName(asset),
                  rightTitle: formatter.assetBalance(asset))
    }
}
