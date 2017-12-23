//
//  CommunityViewController.swift
//  Coinjet
//
//  Created by Daeyun Ethan Kim on 27/11/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - CommunityViewController
class CommunityViewController: UIViewController {

    // MARK: Properties
    let contentCellID = "ContentTableViewCell"
    let showDetailSegueID = "ShowDetailSegue"
    let newPostSegueID = "NewPostSegue"
    
    // MARK: Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        initNavigationView()
        initSearchBar()
    }
    
    private func initNavigationView() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 156/255, green: 108/255, blue: 230/255, alpha: 1.0)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
    private func initSearchBar() {
        searchBar.positionAdjustment(for: .search)
        searchBar.setPositionAdjustment(UIOffset(horizontal: UIScreen.main.bounds.width / 2 - 60, vertical: 0.0), for: .search)
    }
}

// MARK: - CommunityViewController: UITableViewDataSource, UITableViewDelegate
extension CommunityViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: contentCellID, for: indexPath) as? ContentTableViewCell else {
            return UITableViewCell()
        }
        
//        let isToday = indexPath.row % 2 == 0 ? true : false
        let isToday = false
        cell.configureCell(isToday: isToday)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: showDetailSegueID, sender: nil)
    }
}
