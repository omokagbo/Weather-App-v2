//
//  ViewController.swift
//  Weather™
//
//  Created by omokagbo on 30/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = ObjectDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        dataSource.viewModel.setupWeatherRequests()
        dataSource.viewModel.requestCompletion = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    fileprivate func setupTableView() {
        tableView.register(CurrentWeatherTableViewCell.nib(), forCellReuseIdentifier: CurrentWeatherTableViewCell.identifier)
        tableView.register(DailyWeatherTableViewCell.nib(), forCellReuseIdentifier: DailyWeatherTableViewCell.identifier)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.tableFooterView = UIView()
    }
}
