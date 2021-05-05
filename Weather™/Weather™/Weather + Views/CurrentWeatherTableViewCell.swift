//
//  CurrentWeatherTableViewCell.swift
//  Weather™
//
//  Created by omokagbo on 02/05/2021.
//

import UIKit

// MARK:- SETUP FOR THE CURRENT WEATHER DISPLAY

class CurrentWeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currentTempBig: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var currentTempSmall: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var weatherDisplayView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static let identifier = "CurrentWeatherTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "CurrentWeatherTableViewCell", bundle: nil)
    }
    
    func configure(with viewModel: WeatherResponse) {
        self.currentTempBig.text = "\(Int(viewModel.main.temp))˚"
        self.currentTempSmall.text = "\(Int(viewModel.main.temp))˚"
        self.minTemp.text = "\(Int(viewModel.main.temp_min))˚"
        self.maxTemp.text = "\(Int(viewModel.main.temp_max))˚"
        self.weatherDescription.text = "\(viewModel.weather[0].main.uppercased())˚"
        
        let description = viewModel.weather[0].main
        if description.contains("Rain") {
            self.backgroundImage.image = #imageLiteral(resourceName: "sea_rainy")
            self.weatherDisplayView.backgroundColor = .darkGray
        } else if description.contains("Clouds") {
            self.backgroundImage.image = #imageLiteral(resourceName: "sea_cloudy")
            self.weatherDisplayView.backgroundColor = .lightGray
        } else if description.contains("Sunny") {
            self.backgroundImage.image = #imageLiteral(resourceName: "sea_sunnypng")
            self.weatherDisplayView.backgroundColor = .link
        }
    }
}
