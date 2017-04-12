//
//  EventCell.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 05/02/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit


class EventCell: UITableViewCell {
    
  
    @IBOutlet weak var dateView: DateView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var reason: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var campusBt: UIButton!
    @IBOutlet weak var cursusBt: UIButton!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.leftView.backgroundColor = UIColor.ynovGreen
        self.dateView.layer.cornerRadius = 8.0
        self.layer.cornerRadius = 8.0
        self.layer.borderColor = UIColor.ynovGreen.cgColor
        self.layer.borderWidth = 1.0
        self.campusBt.layer.borderColor = UIColor.ynovPink.cgColor
        self.campusBt.layer.backgroundColor = UIColor.ynovPink.cgColor
        self.cursusBt.layer.borderColor = UIColor.ynovPink.cgColor
        self.cursusBt.layer.backgroundColor = UIColor.ynovPink.cgColor
        self.campusBt.layer.cornerRadius = 8.0
        self.cursusBt.layer.cornerRadius = 8.0
        // Initialization code
    }
    deinit
    {
        ignoreFrameChanges()
    }
    
    
    func ignoreFrameChanges() {
        
        removeObserver(self, forKeyPath: "frame")
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
