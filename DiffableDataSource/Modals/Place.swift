//
//  Place.swift
//  DiffableDataSource
//
//  Created by SR on 7/30/20.
//  Copyright © 2020 SR. All rights reserved.
//

import Foundation


struct Place: Decodable {
  
    let id: String
    let name: String
    let description: String
    let imageName: String
}



extension Place: Hashable {
    
    // Diffing mechanism
    func hash(into hasher: inout Hasher) {
       
        hasher.combine(id)
    }
}



// Load JSON
extension Array where Element == Place {
    
    static var landonJSON: Self {
        
        Bundle.loadJson(filename: "London")!
    }
    
    static var parisJSON: Self {
        
        Bundle.loadJson(filename: "Paris")!
    }
}
