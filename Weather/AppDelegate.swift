//
//  AppDelegate.swift
//  Weather
//
//  Created by Sergei Prikhodko on 07.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let weatherManager = WeatherManager()
    var startViewModel: CitiesViewModel!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")!.load()
        
        startViewModel = CitiesViewModel(weatherManager: weatherManager)
        if let navController = self.window?.rootViewController as? UINavigationController,
            let startViewController = navController.topViewController  as? CitiesViewController {
            startViewController.viewModel = startViewModel
        }
        
        return true
    }
}

