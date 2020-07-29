//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by SR on 7/29/20.
//  Copyright © 2020 SR. All rights reserved.
//

import UIKit

class PlaceViewController: UITableViewController {
    
    
    // Declaratons
    var dataSource: PlaceTableViewDiffableDataSource!
    var json: [(Location, [Place])] = [(Location.London, .landonJSON), (Location.Paris, .parisJSON)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTableView()
        buildAndApplySnapshot(false)
        addShuffleButton()
    }
    
    
    func setupTableView() {
        
        
        dataSource = PlaceTableViewDiffableDataSource(tableView: tableView) { (tableView, indexPath, place) -> UITableViewCell? in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as! PlaceTableViewCell
            cell.data = place
            return cell
        }
    }
    
    
    private func buildAndApplySnapshot(_ animate: Bool) {
      
        var snapshot = NSDiffableDataSourceSnapshot<Location, Place>()
        json.forEach { (item) in
            
            let (location, places) = item
            snapshot.appendSections([location])
            snapshot.appendItems(places, toSection: location)
        }
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
}




extension PlaceViewController {
    
    
    func addShuffleButton() {
      
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "random.png") , style: .plain, target: self, action: #selector(shuffle(_:)))
    }
    
    
    @objc func shuffle(_ sender: UIBarButtonItem) {
      
        self.json = json.map { ($0, $1.shuffled()) }.shuffled()
        buildAndApplySnapshot(true)
    }
}

