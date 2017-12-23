//
//  MarketPricePagerTabController.swift
//  Coinjet
//
//  Created by snow on 2017. 12. 16..
//  Copyright © 2017년 Daeyun Ethan Kim. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class MarketPricePagerTabController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var tabButtonBarView: ButtonBarView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        setSetting()
        
        buttonBarView = tabButtonBarView
        containerView = scrollView
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, _, changeCurrentIndex: Bool, _) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = .black
        }
        
        super.viewDidLoad()
    }
    
    fileprivate func setSetting() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = .black
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        settings.style.buttonBarItemFont = UIFont(name: "Helvetica Neue", size: 13)!
    }
    
    // MARK: - PagerTabStripDataSource
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child1Storyboard = UIStoryboard(name: "MarketPrice", bundle: nil)
        let child1ViewController = child1Storyboard.instantiateInitialViewController() as! MarketPriceViewController
        child1ViewController.indicatorInfo.title = "BTC"
        
        let child2Storyboard = UIStoryboard(name: "MarketPrice", bundle: nil)
        let child2ViewController = child2Storyboard.instantiateInitialViewController() as! MarketPriceViewController
        child2ViewController.indicatorInfo.title = "ETH"
        
        let child3Storyboard = UIStoryboard(name: "MarketPrice", bundle: nil)
        let child3ViewController = child3Storyboard.instantiateInitialViewController() as! MarketPriceViewController
        child3ViewController.indicatorInfo.title = "DASH"
        
        let child4Storyboard = UIStoryboard(name: "MarketPrice", bundle: nil)
        let child4ViewController = child4Storyboard.instantiateInitialViewController() as! MarketPriceViewController
        child4ViewController.indicatorInfo.title = "LTC"
        
        let child5Storyboard = UIStoryboard(name: "MarketPrice", bundle: nil)
        let child5ViewController = child5Storyboard.instantiateInitialViewController() as! MarketPriceViewController
        child5ViewController.indicatorInfo.title = "ETC"
        
        return [child1ViewController, child2ViewController, child3ViewController, child4ViewController, child5ViewController]
    }
    
}
