# Weathers

## Краткое описание
В этом приложении вы можете просматривать погодные данные для различных городов в данный момент времени.
Используемое API для получения погодных данных: OpenWeatherMap.
Стек основных используемых технологий: REST API, URLSession, UserDefaults, MVC.

### Стартовый экран: 
![alt text](https://sun9-40.userapi.com/c855720/v855720673/202a60/iqk5fCj1jYk.jpg "Logo Title Text 1")

### Просмотр погоды в выбранном городе: 
![alt text](https://sun9-60.userapi.com/c855720/v855720015/20dc04/2MI_QJX06ts.jpg "Logo Title Text 1")

## Пример кода
Как я "распаршиваю" JSON через URLSession

```swift
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
```

### Имеется возможность редактирования сохраненные городов: 
![alt text](https://sun9-51.userapi.com/c855720/v855720015/20dbfb/4u-2Mf29gGI.jpg "Logo Title Text 1")

## Проблеммы с которыми столкнулся:
* Collection Cell не хотел нормально отображаться на эране;
* Возникали проблеммы при разворачивании данных из JSON-а, приходилось редактировать структуру данных;
* Были трудности с сохранением данных при редактировании в tableView;
* Collection не хотел обновляться после изменения данных в моделе. 
