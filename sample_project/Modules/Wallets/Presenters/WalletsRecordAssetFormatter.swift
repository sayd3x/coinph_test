//
//  WalletsAssetFormatter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 10.04.2021.
//

import Foundation

protocol WalletsRecordAssetFormatter {
    func assetName(_ asset: WalletsAsset) -> String
    func assetBalance(_ asset: WalletsAsset) -> String
}
