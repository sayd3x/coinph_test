//
//  WalletsAsset+Asset.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 09.04.2021.
//

import Foundation

extension WalletsAsset {
    init(_ asset: Asset) {
        self.init(id: asset.id,
                  name: asset.name,
                  balance: asset.balance.map{Decimal(string: $0)} ?? nil)
    }
}
