//
//  StorageManager.swift
//  Weathers
//
//  Created by Stepan Vasilyeu on 3/5/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private var cities = WeatherCities()
    private let userDefaults = UserDefaults.standard
    
    private let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    private var archiveURL: URL!
    
    init() {
        archiveURL = documentDirectory.appendingPathComponent("Cities").appendingPathExtension("plist")
    }

    func saveCitiesToFile(_ cities: WeatherCities) {
        guard let citiesData = try? PropertyListEncoder().encode(cities) else { return }
        try? citiesData.write(to: archiveURL, options: .noFileProtection)
    }
    
    func fetchCitiesFromFile() -> WeatherCities {
        guard let citiesData = try? Data(contentsOf: archiveURL) else { return cities }
        guard let cities = try? PropertyListDecoder().decode(WeatherCities.self, from: citiesData) else { return self.cities}
        return cities
    }
}
