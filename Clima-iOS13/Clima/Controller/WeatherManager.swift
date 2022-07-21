//
//  WeatherManager.swift
//  Clima
//
//  Created by Mark Frazier on 7/20/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=424f400a3ea9cf476bc7d8ac460b5395&units=metric"
    
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // Create URL
        
        if let url = URL(string: urlString) {
            
        // Create a URLSession
        let session = URLSession(configuration: .default)
        
        // Give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
        
        // Start the task, call resume() to start the task
        task.resume()
    }
        
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
        
    }
    
}
