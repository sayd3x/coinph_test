//
//  WalletsErrorRecordViewModelSource.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 10.04.2021.
//

import Foundation

struct WalletsErrorRecordViewModelSource: WalletsErrorRecordViewModel {
    var title: String?
    var description: String?
}

extension WalletsErrorRecordViewModelSource {
    init(_ error: Error) {
        self.init(title: error.localizedDescription,
                  description: "Tap here to reload")
    }
}
