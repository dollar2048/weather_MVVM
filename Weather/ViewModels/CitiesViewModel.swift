//
//  CitiesViewModel.swift
//  Weather
//
//  Created by Sergei Prikhodko on 07.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

// no UIKit

class CitiesViewModel {
    // weak to model
    weak var weatherManager: WeatherManager!

    private var weathers = [Weather]()
    private var cityCellViewModels = [CityCellViewModel]()
    var detailViewModel: DetailsViewModel!

    required init(weatherManager: WeatherManager) {
        self.weatherManager = weatherManager
    }

    func updateWeather(completion: @escaping () -> Void) {
        cityCellViewModels.removeAll()
        weatherManager.getWeather { (weathers) -> Void in
            self.weathers = weathers
            for weather in weathers {
                self.cityCellViewModels.append(CityCellViewModel(weather: weather))
            }
            completion()
        }
    }

    func numberOfCities() -> Int {
        return cityCellViewModels.count
    }

    func cellViewModel(index: Int) -> CityCellViewModel? {
        guard index < weathers.count && index > = 0 else { return nil }

        return cityCellViewModels[index]
    }

    func detailsViewModel(index: Int) -> DetailsViewModel? {
        detailViewModel = DetailsViewModel(weather: weathers[index])
        return detailViewModel
    }
}
