//
//  WeatherManager.swift
//  Clima
//
//  Created by Mark Frazier on 7/20/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation


struct WeatherManager {
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?appid=424f400a3ea9cf476bc7d8ac460b5395&units=metric"
    
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName))"
        print(urlString)
    }
    
}
