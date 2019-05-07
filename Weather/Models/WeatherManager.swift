//
//  WeatherManager.swift
//  Weather
//
//  Created by Sergei Prikhodko on 07.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

// no UIKit
import Foundation

class WeatherManager {
    func getWeather(completion:@escaping ([Weather]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            completion(self.mockResponse())
        })
    }
    
    // MARK: - private
    
    private func mockResponse() -> [Weather] {
        var array = [Weather]()
        array.append(mockWeatherObject(10.2, "Moscow", .Sunny, 2.1, .North))
        array.append(mockWeatherObject(8.2, "London", .Cloudly, 0.1, .South))
        array.append(mockWeatherObject(18.9, "Madrid", .Sunny,0, .North))
        array.append(mockWeatherObject(7.1, "Dublin", .Rainy,4.7, .East))
        array.append(mockWeatherObject(22.5, "Tivat", .Sunny,1.5, .South))
        return array
    }
    
    private func mockWeatherObject(_ temperature: Float,_ city: String,
                                   _ precipitation: Precipitation,_ windSpeed: Float,_ windDirection: WindDirection) -> Weather {
        var weather = Weather()
        weather.temperature = temperature
        weather.city = city
        weather.timestamp = NSDate().timeIntervalSince1970
        weather.precipitation = precipitation
        weather.windSpeed = windSpeed
        weather.windDirection = windDirection
        return weather
    }}
