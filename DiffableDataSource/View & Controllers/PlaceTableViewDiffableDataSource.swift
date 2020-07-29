//
//  PlaceTableViewDiffableDataSource.swift
//  DiffableDataSource
//
//  Created by SR on 7/29/20.
//  Copyright © 2020 SR. All rights reserved.
//

import Foundation
import UIKit

class PlaceTableViewDiffableDataSource: UITableViewDiffableDataSource<Location, Place> {
    
    // Set Title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        return snapshot().sectionIdentifiers[section].rawValue
    }
}
