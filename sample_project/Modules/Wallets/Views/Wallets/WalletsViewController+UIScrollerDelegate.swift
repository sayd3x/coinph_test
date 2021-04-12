//
//  WalletsViewController+UIScrollerDelegate.swift
//  sample_project
//
//  Created by Konstantin Dorogan on 12.04.2021.
//

import UIKit

extension WalletsViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard scrollView === pageScroller else { return }
        let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        
        activateTabWithPage(pageIndex)
    }
}
