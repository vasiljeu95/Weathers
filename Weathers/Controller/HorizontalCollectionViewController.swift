//
//  HorizontalCollectionViewController.swift
//  Weathers
//
//  Created by Stepan Vasilyeu on 2/16/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "horizontalCell"

class HorizontalCollectionViewController: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {

    var temperatures: [TempData] = {
        var firstTemp = TempData()
        firstTemp.temperature = "25 ℃"
        
        var secondTemp = TempData()
        secondTemp.temperature = "17 ℃"
        
        var thirdTemp = TempData()
        thirdTemp.temperature = "20 ℃"
        
        var fourthTemp = TempData()
        fourthTemp.temperature = "-1 ℃"
        
        var fifthTemp = TempData()
        fifthTemp.temperature = "5 ℃"
        
        return [firstTemp, secondTemp, thirdTemp, fourthTemp, fifthTemp]
    }()
    
    // MARK: - UICollectionViewDataSource
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

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
}
