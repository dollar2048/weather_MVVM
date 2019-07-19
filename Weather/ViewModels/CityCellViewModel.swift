//
//  CityCellViewModel.swift
//  Weather
//
//  Created by Sergei Prikhodko on 07.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

import Foundation

class CityCellViewModel {
    var cityTitle: String!
    var temperatureString: String!
    var timeString: String!

    required init(weather: Weather) {
        self.cityTitle = weather.city
        self.temperatureString = String(format: "%0.f%@", weather.temperature, "\u{00B0}")

        let df = DateFormatter()
        let date = Date(timeIntervalSince1970: weather.timestamp)
        df.dateFormat = "HH:mm"
        self.timeString = df.string(from: date)
    }

}
