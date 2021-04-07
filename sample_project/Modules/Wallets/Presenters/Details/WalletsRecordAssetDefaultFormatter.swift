//
//  WalletsAssetDefaultFormatter.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 10.04.2021.
//

import Foundation

struct WalletsRecordAssetDefaultFormatter: WalletsRecordAssetFormatter {
    func assetName(_ asset: WalletsAsset) -> String {
        return asset.name ?? ""
    }
    
    func assetBalance(_ asset: WalletsAsset) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return asset.balance.map{ formatter.string(for: $0 as NSDecimalNumber) ?? "" } ?? ""
    }
}
