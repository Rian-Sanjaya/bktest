//
//  CollectionViewCell.swift
//  bktest
//
//  Created by Rian Sanjaya Ng on 23/01/19.
//  Copyright © 2019 Rian Sanjaya Ng. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var proImage: UIImageView!
    @IBOutlet var prodLabel: UILabel!
    
    func displayContent(image: UIImage, title: String) {
        proImage.image = image
        prodLabel.text = title
    }
}
