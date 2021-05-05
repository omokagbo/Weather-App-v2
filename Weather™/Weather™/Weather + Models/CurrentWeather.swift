//  CurrentWeather.swift
//  Weather™
//
//  Created by omokagbo on 01/05/2021.

import Foundation

//MARK:- WEATHER RESPONSE
struct WeatherResponse: Codable {
    let weather: [Weather]
    let main: Main
}

//MARK:- WEATHER
struct Weather: Codable {
    let id: Double
    let main: String
    let description: String
}

//MARK:- MAIN
struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}
