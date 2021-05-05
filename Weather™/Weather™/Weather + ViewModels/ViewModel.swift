//  ViewModel.swift
//  Weather™
//
//  Created by omokagbo on 02/05/2021.

import Foundation

// MARK:- VIEW MODEL

class ViewModel {
    
    var weatherForecast = [List]()
    var currentWeather: WeatherResponse?
    
    var requestCompletion: (() -> Void)?
    
    let currentWeatherURL = "https://api.openweathermap.org/data/2.5/weather?q=Ososo&units=metric&appid={API KEY}"
    let forecastWeatherURL = "https://api.openweathermap.org/data/2.5/forecast?q=Ososo&units=metric&appid={API KEY}"
    
    func setupWeatherRequests() {
        let group = DispatchGroup()
        
        var currentWeatherGroup: WeatherResponse?
        var forecastWeatherGroup: WeatherForecast?
        
        group.enter()
        fetchCurrentWeatherData(from: currentWeatherURL) { data in
            currentWeatherGroup = data
            group.leave()
        }
        
        group.enter()
        fetchWeatherForecastData(from: forecastWeatherURL) { data in
            forecastWeatherGroup = data
            group.leave()
        }
        
        group.notify(queue: .main) { [weak self] in
            self?.currentWeather = currentWeatherGroup
            self?.weatherForecast = forecastWeatherGroup?.list ?? []
            DispatchQueue.main.async {
                self?.requestCompletion?()
            }
        }
    }
    
    
    /// METHOD FOR FETCHING CURRENT WEATHER DATA
    
    func fetchCurrentWeatherData(from urlString: String, completion: ((WeatherResponse?) -> Void)?) {
        guard let url = URL(string: urlString) else {
            print("could not load url")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                let json = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion?(json)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
            
        }.resume()
    }
    
    
    /// METHOD FOR FETCHING WEATHER FORECAST
    
    func fetchWeatherForecastData(from urlString: String, completion: ((WeatherForecast?) -> Void)?) {
        guard let url = URL(string: urlString) else {
            print("could not load url")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(String(describing: error?.localizedDescription))")
                return
            }
            var json: WeatherForecast?
            do {
                json = try JSONDecoder().decode(WeatherForecast.self, from: data)
                completion?(json)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
