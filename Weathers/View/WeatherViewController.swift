//
//  WeatherViewController.swift
//  Weathers
//
//  Created by Stepan Vasilyeu on 2/21/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet var cloudImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var weathersLabel: UILabel!
    @IBOutlet var temperatureCityLabel: UILabel!
    @IBOutlet var perceivedTemperatureLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var cloudinessLabel: UILabel!
        
    var weatherDataSender: String!
    
    func getTemp(city: String) {
        let jsonUrl = "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=4d24cbf9d70b0c3cedc62cc36c70ec13"
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let weatherProperty = try JSONDecoder().decode(WeatherProperty.self, from: data)
                DispatchQueue.main.async {
                    
                    let tempCelsius = fahrenheitInCelsius(fahrenheitTemp: (weatherProperty.main!.temp ?? 0))
                    let pressure = weatherProperty.main!.pressure ?? 0
                    let humidity = weatherProperty.main!.humidity ?? 0
                    let windSpeed = weatherProperty.wind!.speed ?? 0
                    let cloudiness = weatherProperty.clouds!.all ?? 0
                    let perceivedTemperature = windColdIndex(tempAir: tempCelsius, speedWind: windSpeed)
                    let cloudImageView = weatherProperty.weather![0].icon
                        
                    self.cityNameLabel.text = weatherProperty.name
                    self.weathersLabel.text = weatherProperty.weather![0].weatherDescription
                    self.temperatureCityLabel.text = ("\(NSString(format:"%.f", tempCelsius)) °")
                    self.perceivedTemperatureLabel.text = ("feels like: \(NSString(format:"%.f", perceivedTemperature)) °")
                    self.pressureLabel.text = ("pressure: \(NSString(format:"%.f", pressure)) hPa")
                    self.humidityLabel.text = ("humidity: \(NSString(format:"%.f", humidity)) %")
                    self.windSpeedLabel.text = ("wind: \(NSString(format:"%.f", windSpeed)) m/s")
                    self.cloudinessLabel.text = ("cloud: \(NSString(format:"%.f", cloudiness)) %")
                    self.cloudImageView.image = UIImage(named: cloudImageView ?? "sun")
                    
                    self.view.reloadInputViews()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getTemp(city: weatherDataSender)
        
//        transform(for: cloudImageView,
//                  nameAnimation: "transform.scale",
//                  duration: 0.7,
//                  fromValue: 0.97,
//                  toValue: 1.93,
//                  autoreverses: true,
//                  repeatCount: Float.greatestFiniteMagnitude)
        //cloudAnimate()
    }
    
    // Функция движения облaчка =) - пока не работает
    func cloudAnimate () {
        UIView.animate(withDuration: 20,
                       delay: 0,
                       options: [.autoreverse, .repeat],
                       animations: {
                        // для того чтобы вьюха с анимацией не "уезжала" за свои границы
                        self.cloudImageView.frame.origin.x += 228 // 288 - "рабочкий" размер экрана iPhone SE, -60 - размер самой imageView
        })
    }

}
