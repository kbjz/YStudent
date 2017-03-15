//
//  StudentCell.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 01/03/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var firstNameLb: UILabel!
    @IBOutlet weak var lastNameLb: UILabel!
    @IBOutlet weak var mailLb: UILabel!
    @IBOutlet weak var phoneLb: UILabel!
    @IBOutlet weak var actualLevelLb: UILabel!
    @IBOutlet weak var cursusAskedLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8.0
        self.layer.borderColor = UIColor.ynovGreen.cgColor
        self.layer.borderWidth = 1.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
