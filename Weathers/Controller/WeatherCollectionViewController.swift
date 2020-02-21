//
//  WeatherCollectionViewController.swift
//  Weathers
//
//  Created by Stepan Vasilyeu on 2/21/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class WeatherCollectionViewController: UICollectionViewController {

    private let weathersCities = WeatherCities.weatherCitiesArray

    // MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return weathersCities.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return weathersCities[section].weatherDataArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as! WeatherCollectionViewCell
    
        cell.cityLabel.text = weathersCities[indexPath.section].weatherDataArray[indexPath.row]
    
        return cell
    }

    // MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let weatherCity = weathersCities[indexPath.section].weatherDataArray[indexPath.row]
        performSegue(withIdentifier: "showWeather", sender: weatherCity)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWeather" {
            let weatherVC = segue.destination as! WeatherViewController
            weatherVC.weatherDataSender = sender as? String
        }
    }
}

extension WeatherCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
