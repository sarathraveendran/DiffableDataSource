//
//  Bundle.swift
//  DiffableDataSource
//
//  Created by SR on 7/30/20.
//  Copyright © 2020 SR. All rights reserved.
//

import Foundation

extension Bundle {
    
    static func loadJson<T: Decodable>(filename: String) -> T?  {
      
        guard let url = main.url(forResource: filename, withExtension: "json") else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        let decoded = try? JSONDecoder().decode(T.self, from: data)
        return decoded
    }
    
}

