//
//  DetailViewController.swift
//  Coinjet
//
//  Created by Daeyun Ethan Kim on 23/12/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - DetailViewController
class DetailViewController: UIViewController {
    
    // MARK: Properties
    
    // MARK: Outlets
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationView()
    }
    
    private func initNavigationView() {
        navigationItem.title = "커뮤니티"
        
        let rightBarItem = UIBarButtonItem(title: "새 글", style: .plain, target: self, action: #selector(bookMark))
        navigationItem.rightBarButtonItem = rightBarItem
    }
    
    // MARK: Actions
    @objc private func bookMark() {
        
    }
    
    
}
