//
//  CardListViewModel.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 24.03.2021.
//

import Foundation

protocol CardListViewModel {
    func observeItems(_ observer: @escaping ([CardListItemViewModel]) -> Void) -> Cancellable
}
