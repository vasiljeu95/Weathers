//
//  HorizontalCollectionViewCell.swift
//  Weathers
//
//  Created by Stepan Vasilyeu on 2/16/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class FiveDaysTempCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var tempImageView: UIImageView!
    @IBOutlet var fiveDaysTempLabel: UILabel!
    @IBOutlet var cityTempLabel: UILabel!
    
    var temp: TempData? {
        didSet {
            fiveDaysTempLabel.text = temp?.temperature
            cityTempLabel.text = temp?.city

            if let image = temp?.imageTemp {
                tempImageView.image = UIImage(named: image)
            }
        }
    }
}
