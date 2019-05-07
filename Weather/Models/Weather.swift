//
//  Weather.swift
//  Weather
//
//  Created by Sergei Prikhodko on 07.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

struct Weather {
    var temperature: Float!
    var city: String!
    var timestamp: Double!
    var precipitation: Precipitation!
    var windSpeed: Float!
    var windDirection: WindDirection!
}

enum Precipitation {
    case Cloudly, Rainy, Stormly, Thunderly, Sunny
}

enum WindDirection {
    case North, South, West, East
}
