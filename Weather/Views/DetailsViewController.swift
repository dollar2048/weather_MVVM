//
//  DetailsViewController.swift
//  Weather
//
//  Created by Sergei Prikhodko on 07.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!

    weak var viewModel: DetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.weatherLabel.text = viewModel.temperatureString
        self.windLabel.text = viewModel.windString
        self.cityLabel.text = viewModel.cityTitle
        self.precipitationLabel.text = viewModel.precipitationString
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
