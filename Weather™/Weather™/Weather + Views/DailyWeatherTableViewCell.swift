//  DailyWeatherTableViewCell.swift
//  Weather™
//
//  Created by omokagbo on 01/05/2021.

import UIKit

// MARK:- SETUP FOR THE 5 DAYS WEATHER DISPLAY

class DailyWeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dayOfTheWeek: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var cellBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .lightGray
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static let identifier = "DailyWeatherTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "DailyWeatherTableViewCell", bundle: nil)
    }
    
    func configure(with viewModel: List) {
        self.temp.text = "\(Int(viewModel.main.temp))˚"
        self.dayOfTheWeek.text = getDayOfTheWeek(Date(timeIntervalSince1970: Double(viewModel.dt)))
        let weatherColor = CurrentWeatherTableViewCell().weatherDisplayView?.backgroundColor
        let description = viewModel.weather[0].main
        if description.contains("Rains") {
            self.weatherImage.image = #imageLiteral(resourceName: "rain")
            cellBackground.backgroundColor = weatherColor
        } else if description.contains("Clouds") {
            self.weatherImage.image = #imageLiteral(resourceName: "partlysunny")
            cellBackground.backgroundColor = weatherColor
        } else if description.contains("Sunny"){
            self.weatherImage.image = #imageLiteral(resourceName: "clear")
            cellBackground.backgroundColor = weatherColor
        }
        
        func getDayOfTheWeek(_ date: Date?) -> String {
            guard let date = date else { return "" }
            let formatter = DateFormatter()
            formatter.dateFormat = "EEE"
            return formatter.string(from: date)
        }
    }
}
