//
//  FiveDaysWaetherJSONData.swift
//  Weathers
//
//  Created by Stepan Vasilyeu on 2/17/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import Foundation

// MARK: - FiveDaysForThreeHoursWeather
struct FiveDaysForThreeHoursWeather: Codable {
    let cod: String
    let message: Double
    let cnt: Int
    let list: [ListFiveDaysWeather]
    let city: CityFiveDaysWeather
}

// MARK: - City
struct CityFiveDaysWeather: Codable {
    let id: Int
    let name: String
    let coord: CoordFiveDaysWeather
    let country: String
}

// MARK: - CoordFiveDaysWeather
struct CoordFiveDaysWeather: Codable {
    let lat, lon: Double
}

// MARK: - List
struct ListFiveDaysWeather: Codable {
    let dt: Int
    let main: MainClass
    let weather: [WeatherFiveDaysWeather]
    let clouds: CloudsFiveDaysWeather
    let wind: WindFiveDaysWeather
    let rain: Rain
    let sys: SysFiveDaysWeather
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, rain, sys
        case dtTxt = "dt_txt"
    }
}

// MARK: - Clouds
struct CloudsFiveDaysWeather: Codable {
    let all: Int
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, tempMin, tempMax, pressure: Double
    let seaLevel, grndLevel: Double
    let humidity, tempKf: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
struct Rain: Codable {
}

// MARK: - Sys
struct SysFiveDaysWeather: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct WeatherFiveDaysWeather: Codable {
    let id: Int
    let main: MainEnum
    let weatherDescription: Description
    let icon: Icon

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum Icon: String, Codable {
    case the01D = "01d"
    case the01N = "01n"
    case the02D = "02d"
    case the02N = "02n"
    case the03N = "03n"
    case the04N = "04n"
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case scatteredClouds = "scattered clouds"
}

// MARK: - Wind
struct WindFiveDaysWeather: Codable {
    let speed, deg: Double
}
