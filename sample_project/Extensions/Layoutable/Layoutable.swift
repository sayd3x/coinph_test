//
//  Layoutable.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import UIKit

protocol Layoutable {
    var layoutableSubviews: [UIView] { get }
    var layoutableConstraints: [NSLayoutConstraint] { get }
}
