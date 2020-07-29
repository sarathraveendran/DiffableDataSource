//
//  PlaceTableViewCell.swift
//  DiffableDataSource
//
//  Created by SR on 7/30/20.
//  Copyright © 2020 SR. All rights reserved.
//

import Foundation
import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    // MARK: Connection Obects
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var placeImageView: UIImageView!
    
    
    var data: Place? {
        
        didSet {
           
            titleLabel.text = data?.name ?? nil
            descriptionLabel.text = data?.description ?? nil
            placeImageView.image = UIImage(named: data?.imageName ?? "")
        }
    }
}
