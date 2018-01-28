//
//  SplashViewController.swift
//  Coinjet
//
//  Created by Lucas on 2018. 1. 28..
//  Copyright © 2018년 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    static func makeInstance() -> SplashViewController {
        let storyboard = UIStoryboard(name: "StartTask", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
    }
    
    func hideSplashView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
}
