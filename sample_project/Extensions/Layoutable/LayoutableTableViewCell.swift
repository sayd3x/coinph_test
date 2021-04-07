//
//  LayoutableTableViewCell.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 07.04.2021.
//

import UIKit

class LayoutableTableViewCell: TableViewCell {
    
    override func setupSubviews() {
        super.setupSubviews()
        
        if let layoutable = self as? Layoutable {
            layoutable.layoutableSubviews.forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                self.addSubview($0)
            }
            
            NSLayoutConstraint.activate(layoutable.layoutableConstraints)
        }
    }
    
}
