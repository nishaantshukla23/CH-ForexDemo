//
//  ForexCell.swift
//  ForexDemo
//
//  Created by Vedvyas Kumar Rauniyar on 13/02/23.
//

import UIKit

class ForexCell: UITableViewCell {
   
    // MARK: - Outlet
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Variables
    static let identifier = String(describing: ForexCell.self)
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// Setting Cell UI
    /// - Parameter name: title of the Label
    func setUpcell(name: String){
        titleLabel.text = name
    }
}
