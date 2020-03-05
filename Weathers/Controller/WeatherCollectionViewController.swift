//
//  WeatherCollectionViewController.swift
//  Weathers
//
//  Created by Stepan Vasilyeu on 2/21/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class WeatherCollectionViewController: UICollectionViewController {

    private var cities: WeatherCities!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Restore from Plist
        cities = StorageManager.shared.fetchCitiesFromFile()
        collectionView.reloadData()
    }

    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.weatherCitiesArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as! WeatherCollectionViewCell
    
        cell.cityLabel.text = cities.weatherCitiesArray[indexPath.row]
    
        return cell
    }

    // MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let weatherCity = cities.weatherCitiesArray[indexPath.row]
        performSegue(withIdentifier: "showWeather", sender: weatherCity)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWeather" {
            let weatherVC = segue.destination as! WeatherViewController
            weatherVC.weatherDataSender = sender as? String
        }
    }
    
//    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
//        let _ = segue.source as! CitiesTableViewController
//        collectionView.reloadData()
//    }

}

extension WeatherCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
