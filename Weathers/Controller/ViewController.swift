//
//  ViewController.swift
//  Weathers
//
//  Created by Stepan Vasilyeu on 2/16/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var horizontalCollection: UICollectionView!
    @IBOutlet var verticalCollection: UICollectionView!
    
    private let reuseIdentifier = "horizontalCell"
    
    var temperatures: [TempData] = {
        var firstTemp = TempData()
        firstTemp.temperature = "25 ℃"
        firstTemp.imageTemp = "01d"
        
        var secondTemp = TempData()
        secondTemp.temperature = "17 ℃"
        secondTemp.imageTemp = "02d"
        
        var thirdTemp = TempData()
        thirdTemp.temperature = "20 ℃"
        thirdTemp.imageTemp = "03d"
        
        var fourthTemp = TempData()
        fourthTemp.temperature = "-1 ℃"
        fourthTemp.imageTemp = "04d"
        
        var fifthTemp = TempData()
        fifthTemp.temperature = "5 ℃"
        fifthTemp.imageTemp = "09d"
        
        return [firstTemp, secondTemp, thirdTemp, fourthTemp, fifthTemp]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        horizontalCollection.dataSource = self
        horizontalCollection.delegate = self
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(temperatures.count)
        return temperatures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let tempCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? HorizontalCollectionViewCell {
            
            tempCell.temp = temperatures[indexPath.row]
            
            return tempCell
        }
        
        return UICollectionViewCell()
    }
    
    
}
