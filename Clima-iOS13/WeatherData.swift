//
//  WeatherData.swift
//  Clima
//
//  Created by Mark Frazier on 7/21/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation


struct WeatherData: Decodable {
    let name: String
    let main: Main
}

struct Main: Decodable {
    let temp: Double
}
