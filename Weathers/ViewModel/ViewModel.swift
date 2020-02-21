//
//  ViewModel.swift
//  Weathers
//
//  Created by Stepan Vasilyeu on 2/18/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import Foundation

func getTempData(cityName: [String]) -> [TempData] {
    var tempDatas = [TempData]()
    var tempData = TempData()
    
    for city in cityName {
        
        let jsonUrl = "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=4d24cbf9d70b0c3cedc62cc36c70ec13"
        guard let url = URL(string: jsonUrl) else {
            var tempData = TempData()
            tempData.city = city
            tempData.imageTemp = "Unknown"
            tempData.temperature = "Unknown"
            
            tempDatas.append(tempData)
            
            return tempDatas
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let weatherProperty = try JSONDecoder().decode(WeatherProperty.self, from: data)
                DispatchQueue.main.async {
                    
                    tempData.city = city
                    let tempCelsius = fahrenheitInCelsius(fahrenheitTemp: (weatherProperty.main!.temp ?? 0))
                    tempData.temperature = ("\(NSString(format:"%.f", tempCelsius)) °C")
                    tempData.imageTemp = weatherProperty.weather?[0].icon
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
        tempDatas.append(tempData)
    }
    return tempDatas
}

let cityArray = ["Moskow", "Minsk", "Kiev", "Zhlobin", "Lviv", "Ufa", "London"]
private let tempDataValue = getTempData(cityName: cityArray)
