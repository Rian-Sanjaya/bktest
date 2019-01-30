//
//  Data.swift
//  bktest
//
//  Created by Rian Sanjaya Ng on 23/01/19.
//  Copyright © 2019 Rian Sanjaya Ng. All rights reserved.
//

import Foundation

class Product: Codable {
    let description: String
    let image: String
    
    init(description: String, image: String) {
        self.description = description
        self.image = image
    }
}

struct Prod {
    var description: String
    var image: String
    var info: Any
}

