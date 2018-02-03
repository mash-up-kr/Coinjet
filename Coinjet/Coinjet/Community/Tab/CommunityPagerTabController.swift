//
//  MarketPricePagerTabController.swift
//  Coinjet
//
//  Created by snow on 2017. 12. 16..
//  Copyright © 2017년 Daeyun Ethan Kim. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class CommunityPagerTabController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var tabButtonBarView: ButtonBarView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        initView()
        super.viewDidLoad()
    }
    
    fileprivate func initView() {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        gradient.colors = [
            UIColor(rgb: 0x469BD6).cgColor,
            UIColor(rgb: 0x9C6CE6).cgColor
        ]
        
        gradient.frame = (navigationController?.navigationBar.bounds)!
        UIGraphicsBeginImageContext(gradient.frame.size)
        gradient.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        buttonBarView = tabButtonBarView
        containerView = scrollView
        
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = UIColor(red: 156, green: 108, blue: 230)
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        settings.style.buttonBarItemFont = UIFont(name: "HelveticaNeue", size: 13)!
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, _, changeCurrentIndex: Bool, _) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = UIColor(red: 156, green: 108, blue: 230)
        }
    }
    
    // MARK: - PagerTabStripDataSource
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child1Storyboard = UIStoryboard(name: "Community", bundle: nil)
        let child1ViewController = child1Storyboard.instantiateInitialViewController() as! CommunityViewController
        child1ViewController.indicatorInfo.title = "BTC"
        
        let child2Storyboard = UIStoryboard(name: "Community", bundle: nil)
        let child2ViewController = child2Storyboard.instantiateInitialViewController() as! CommunityViewController
        child2ViewController.indicatorInfo.title = "ETH"
        
        let child3Storyboard = UIStoryboard(name: "Community", bundle: nil)
        let child3ViewController = child3Storyboard.instantiateInitialViewController() as! CommunityViewController
        child3ViewController.indicatorInfo.title = "DASH"
        
        let child4Storyboard = UIStoryboard(name: "Community", bundle: nil)
        let child4ViewController = child4Storyboard.instantiateInitialViewController() as! CommunityViewController
        child4ViewController.indicatorInfo.title = "LTC"
        
        let child5Storyboard = UIStoryboard(name: "Community", bundle: nil)
        let child5ViewController = child5Storyboard.instantiateInitialViewController() as! CommunityViewController
        child5ViewController.indicatorInfo.title = "ETC"
        
        return [child1ViewController, child2ViewController, child3ViewController, child4ViewController, child5ViewController]
    }
    
}
