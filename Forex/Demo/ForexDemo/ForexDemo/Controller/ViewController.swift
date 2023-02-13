//
//  ViewController.swift
//  ForexDemo
//
//  Created by N Shukla on 13/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var forexTableView: UITableView!

    // MARK: - Variables
    let titleArray = ["Currency conversion", "Send Money", "Bill Pay", "Cards & Forex","Loans", "UPI Payments"]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titleArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForexCell.identifier) as? ForexCell else { return UITableViewCell()}
        cell.setUpcell(name: titleArray[indexPath.row])
        return cell
    }
}
