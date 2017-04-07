//
//  SchoolCollectionCell.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 07/04/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit

class SchoolCollectionCell: UICollectionViewCell {
    @IBOutlet weak var picture: UIImageView!
    
    override func awakeFromNib() {
        self.layer.borderWidth = 0.8
        self.layer.borderColor = UIColor.ynovPink.cgColor
    }
    
}
