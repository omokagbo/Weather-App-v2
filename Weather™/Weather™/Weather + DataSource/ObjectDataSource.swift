//  ObjectDataSource.swift
//  Weather™
//
//  Created by omokagbo on 04/05/2021.

import UIKit

//MARK:- DATASOURCE

class ObjectDataSource: NSObject {
    
    var viewModel = ViewModel()
    
    private var numberOfRows: Int {
        return viewModel.weatherForecast.count / 8
    }
}


// MARK:- TABLEVIEW DATA SOURCE

extension ObjectDataSource: UITableViewDataSource {
    
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (0.5 * tableView.frame.height)
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrentWeatherTableViewCell.identifier) as? CurrentWeatherTableViewCell
        if let currentWeather = viewModel.currentWeather {
            cell?.configure(with: currentWeather)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyWeatherTableViewCell.identifier, for: indexPath) as? DailyWeatherTableViewCell
        cell?.configure(with: viewModel.weatherForecast[indexPath.row * 8])
        return cell ?? UITableViewCell()
    }
}


// MARK:- TABLEVIEW DELEGATE

extension ObjectDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
