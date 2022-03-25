//
//  MyTableViewCell.swift
//  FibTest
//
//  Created by Samuel on 25/3/22.
//  Copyright © 2022 James Nguyen (JTN). All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    //MARK: -IBOutlets
    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCellWith(identifier: String, number: String){
        identifierLabel.text = identifier
        numberLabel.text = number
        
    }
    
}
