//
//  CitiesViewController.swift
//  Weather
//
//  Created by Sergei Prikhodko on 07.05.19.
//  Copyright © 2019 Sergei Prikhodko. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    // weak to VM
    weak var viewModel: CitiesViewModel! {
        didSet {
            self.viewModel.updateWeather {
                self.tableView.reloadData()
            }
        }
    }

    let cellId = "CityCell"
    let segueId = "ShowDetails"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)

    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get detailsVC
        // inject VM there

        if let id = segue.identifier, id == segueId,
            let detailsController = segue.destination as? DetailsViewController,
            let index = sender as? Int {
            detailsController.viewModel = viewModel.detailsViewModel(index: index)
        }

    }
}

extension CitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCities()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CityCell
        cell.viewModel = viewModel.cellViewModel(index: indexPath.row)
        return cell
    }
}

extension CitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: segueId, sender: indexPath.row)
    }
}

