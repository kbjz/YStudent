//
//  CampusCell.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 15/02/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit

class CampusCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    public var campus = Campus.null
    public var cursus = Cursus.null
    public var ynovReason = YnovReason.null
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected == true {
            self.contentView.backgroundColor = UIColor(hexString: "#06AA9D")
            self.backgroundColor = UIColor(hexString: "#06AA9D")
        } else {
            self.contentView.backgroundColor = UIColor.clear
            self.backgroundColor = UIColor.clear

        }
                // Configure the view for the selected state
    }
    
    

}
