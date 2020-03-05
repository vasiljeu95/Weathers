# Weathers

### 1. Краткое описание
Приложение помогающее в выборе одежды под различные погодные условия, погодные данные можно определять исходя из введённых городов или географических координат.
Используемое API для получения погодных данных: OpenWeatherMap.
Стек основных используемых технологий: REST API, URLSession, UserDefaults, MVC.

Стартовый экран: 
![alt text](https://sun9-47.userapi.com/c855720/v855720673/2029f5/ar0BPTC04yg.jpg "Logo Title Text 1", https://sun9-56.userapi.com/c855720/v855720673/202a19/jITqQdU_wTc.jpg "Logo Title Text 2",)

### 2. Пример кода

### 5. Пример кода
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

### 7. Проблеммы с какими столкнулся:
* Collection Cell не хотел нормально отображаться на эране;
* Возникали проблеммы при разворачивании данных из JSON-а, приходилось редактировать структуру данных;
* Были трудности с сохранением данных при редактировании в tableView;
* Collection не хотел обновляться после изменения данных в моделе. 
