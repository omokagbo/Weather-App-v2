//  WeatherForecast.swift
//  Weather™
//
//  Created by omokagbo on 01/05/2021.

import Foundation

// MARK: - WeatherForecast
struct WeatherForecast: Codable {
    let list: [List]
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: MainTemp
    let weather: [WeatherData]
}

// MARK: - MainTemp
struct MainTemp: Codable {
    let temp: Double
}

// MARK: - WeatherData
struct WeatherData: Codable {
    let id: Int
    let main: String
    let description: String
}
