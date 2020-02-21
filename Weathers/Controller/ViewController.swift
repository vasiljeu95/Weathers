//
//  ViewController.swift
//  Weathers
//
//  Created by Stepan Vasilyeu on 2/16/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var fiveDaysForThreeHoursWeather: UICollectionView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var fiveDaysTempLabel: UILabel!
    
    private let reuseIdentifier = "horizontalCell"
    private let jsonUrl = "https://api.openweathermap.org/data/2.5/weather?q=Minsk&appid=4d24cbf9d70b0c3cedc62cc36c70ec13"
//    private let jsonFiveDaysURL = "https://samples.openweathermap.org/data/2.5/forecast?id=625144&appid=4d24cbf9d70b0c3cedc62cc36c70ec13"
    
//    func getTemp() {
//        guard let url = URL(string: jsonUrl) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            guard let data = data else { return }
//
//            do {
//                let weatherProperty = try JSONDecoder().decode(WeatherProperty.self, from: data)
//                DispatchQueue.main.async {
//
//                    let tempCelsius = fahrenheitInCelsius(fahrenheitTemp: (weatherProperty.main!.temp))
//
//                    self.temperatureLabel.text = ("\(NSString(format:"%.f", tempCelsius)) °C")
//                    self.cityLabel.text = weatherProperty.name
//                    self.weatherLabel.text = weatherProperty.weather![0].description
//
//                    self.view.reloadInputViews()
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }.resume()
//    }
    
    
    
//    func getTempForFiveDays() {
//        guard let url = URL(string: jsonFiveDaysURL) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            guard let data = data else { return }
//
//            do {
//                let weatherFiveDaysProperty = try JSONDecoder().decode(FiveDaysForThreeHoursWeather.self, from: data)
//                DispatchQueue.main.sync {
//
//                    let firstTemp = fahrenheitInCelsius(fahrenheitTemp: (weatherFiveDaysProperty.list![0].main?.temp ?? 12))
//                    self.fiveDaysTempLabel.text = ("\(NSString(format:"%.f", firstTemp)) °C")
//                    print("!!!!!!!!!!!!!!!!!!! = \(String(describing: weatherFiveDaysProperty.list?[0].main?.temp))")
//
//                    self.view.reloadInputViews()
//                }
//            } catch {
//                print("!!!!!!!!!!!!! - \(error.localizedDescription)")
//            }
//        }.resume()
//    }
    
//    var temperatures: [TempData] = {
//        var firstTemp = TempData()
//        firstTemp.temperature = "25 ℃"
//        firstTemp.city = "Moskow"
//        firstTemp.imageTemp = "01d"
//
//        var secondTemp = TempData()
//        secondTemp.temperature = "17 ℃"
//        secondTemp.city = "Minsk"
//        secondTemp.imageTemp = "02d"
//
//        var thirdTemp = TempData()
//        thirdTemp.temperature = "20 ℃"
//        thirdTemp.city = "Kiev"
//        thirdTemp.imageTemp = "03d"
//
//        var fourthTemp = TempData()
//        fourthTemp.temperature = "-1 ℃"
//        fourthTemp.city = "Zhlobin"
//        fourthTemp.imageTemp = "04d"
//
//        var fifthTemp = TempData()
//        fifthTemp.temperature = "5 ℃"
//        fifthTemp.city = "Lviv"
//        fifthTemp.imageTemp = "09d"
//
//        return [firstTemp, secondTemp, thirdTemp, fourthTemp, fifthTemp]
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        fiveDaysForThreeHoursWeather.dataSource = self
//        fiveDaysForThreeHoursWeather.delegate = self
        
        //getTemp()
    }
}

//extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//
//        return tempDataValue
//        //return temperatures.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if let tempCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? FiveDaysTempCollectionViewCell {
//
//            tempCell.temp = temperatures[indexPath.row]
//
//            return tempCell
//        }
//
//        return UICollectionViewCell()
//    }
//
//
//}
