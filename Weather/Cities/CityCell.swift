//
//  CityCell.swift
//  Weather
//
//  Created by Sergei Prikhodko on 07.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    // weak to VM
    weak var viewModel: CityCellViewModel! {
        didSet {
            timeLabel.text = viewModel.timeString
            cityLabel.text = viewModel.cityTitle
            temperatureLabel.text = viewModel.temperatureString
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func cellButtonTapped(_ sender: Any) {
        cityLabel.text = viewModel.cityTitle + " Tapped"
    }
}
