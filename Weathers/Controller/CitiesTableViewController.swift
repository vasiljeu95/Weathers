//
//  CitiesTableViewController.swift
//  Weathers
//
//  Created by Stepan Vasilyeu on 3/4/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class CitiesTableViewController: UITableViewController {

    private var cities: WeatherCities!

    @IBAction func addCitiesButton() {
        addCitiesAllert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cities list"
//        // Set large title - возникают проблеммы в отображением коллекции и значений во вью контроллерах городов
//        navigationController?.navigationBar.prefersLargeTitles = true
        // Restore from Plist
        cities = StorageManager.shared.fetchCitiesFromFile()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.weatherCitiesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "citiesReuseIdentifier", for: indexPath)

        cell.textLabel?.text = cities.weatherCitiesArray[indexPath.row]

        return cell
    }
    
    // MARK: - Change cities data
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.cities.weatherCitiesArray.remove(at: indexPath.row)
            StorageManager.shared.saveCitiesToFile(cities)
            self.tableView.reloadData()
            //self.WeatherCollectionViewController.collectionView.reloadData()
        }
    }
    
}

extension CitiesTableViewController {
    private func addCitiesAllert() {
        
        let alert = UIAlertController(
            title: "Add new cities",
            message: "Please write the city name",
            preferredStyle: .alert)
        
        let saveAction = UIAlertAction(
            title: "Save",
            style: .default) { (action) in
                guard let textField = alert.textFields?.first?.text, !textField.isEmpty else {
                    print("The text field is empty")
                    return
                }
                self.cities.weatherCitiesArray.append(textField)
                StorageManager.shared.saveCitiesToFile(self.cities)
                let cellIndex = IndexPath(row: self.cities.weatherCitiesArray.count - 1, section: 0)
                self.tableView.insertRows(at: [cellIndex], with: .automatic)
        }
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .destructive,
            handler: nil)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter your cities name"
        }
        
        present(alert, animated: true, completion: nil)
    }
}
