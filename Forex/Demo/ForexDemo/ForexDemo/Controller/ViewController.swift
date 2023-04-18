//
//  ViewController.swift
//  ForexDemo
//
//  Created by N Shukla on 13/02/23.
//

import UIKit
import ForexSDK

class ViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var forexTableView: UITableView!

    // MARK: - Variables
    let titleArray = ["Forex", "Send Money", "Bill Pay","Loans", "UPI Payments", "Other"]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titleArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForexCell.identifier) as? ForexCell else { return UITableViewCell()}
        cell.setUpcell(name: titleArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        ForexManager.shared.testSDKAcces()
        ForexManager.shared.testSDKForSwiftUI(navController: self.navigationController)
    }

    
}
