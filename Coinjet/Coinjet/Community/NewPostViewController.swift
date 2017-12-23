//
//  NewPostViewController.swift
//  Coinjet
//
//  Created by Daeyun Ethan Kim on 23/12/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - NewPostViewController
class NewPostViewController: UIViewController {
    
    // MARK: Properties
    
    // MARK: Outlets
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationView()
    }
    
    private func initNavigationView() {
        navigationItem.title = "글쓰기"
        
        let rightBarItem = UIBarButtonItem(title: "게시", style: .plain, target: self, action: #selector(submit))
        navigationItem.rightBarButtonItem = rightBarItem
    }
    
    // MARK: Actions
    @objc private func submit() {
        navigationController?.popViewController(animated: true)
    }
}
