//
//  HorizontalCollectionViewCell.swift
//  Weathers
//
//  Created by Stepan Vasilyeu on 2/16/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var tempImageView: UIImageView!
    @IBOutlet var horizontalLabel: UILabel!
    
    var temp: TempData? {
        didSet {
            horizontalLabel.text = temp?.temperature
            
            if let image = temp?.imageTemp {
                tempImageView.image = UIImage(named: image)
            }
        }
    }
}
