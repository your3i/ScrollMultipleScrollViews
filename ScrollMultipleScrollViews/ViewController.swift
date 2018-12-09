//
//  ViewController.swift
//  ScrollMultipleScrollViews
//
//  Created by your3i on 2018/12/09.
//  Copyright © 2018 your3i. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outerScrollView: UIScrollView!
    @IBOutlet weak var bottomScrollView: UIScrollView!
    @IBOutlet weak var topScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // To scroll the top scroll view backward,
        // first set the top scroll view scrolled to the right edge
        topScrollView.contentOffset = CGPoint(x: topScrollView.bounds.width, y: 0.0)
    }
}

extension ViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == outerScrollView else {
            return
        }

        // Calculate scroll progress
        let outerScrollDistance = outerScrollView.contentSize.width - outerScrollView.bounds.width
        let progress = scrollView.contentOffset.x / outerScrollDistance

        // Scroll the top scroll view backward programmatically
        let topScrollDistance = topScrollView.contentSize.width - topScrollView.bounds.width
        let topOffsetX = (1 - progress) * topScrollDistance
        topScrollView.contentOffset = CGPoint(x: topOffsetX, y: 0.0)

        // Scroll the bottom scroll view forward programmatically
        let bottomScrollDistance = bottomScrollView.contentSize.width - bottomScrollView.bounds.width
        let bottomOffsetX = progress * bottomScrollDistance
        bottomScrollView.contentOffset = CGPoint(x: bottomOffsetX, y: 0.0)
    }
}
