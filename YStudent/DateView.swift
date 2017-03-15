//
//  DateView.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 24/02/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//
import ChameleonFramework
import UIKit
import QuartzCore
 @IBDesignable class DateView: UIView {

    // Our custom view from the XIB file
    var view: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var monthLb: UILabel!
    @IBOutlet weak var yearLb: UILabel!
    @IBOutlet weak var dayLb: UILabel!
    
    @IBOutlet weak var bottomView: UIView!
    override init(frame: CGRect) {
        // 1. setup any properties here
       
        //self.view.layer.cornerRadius = 8.0
        
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
   /* func fillLabels(d:String,m:String,y:String) {
        self.monthLb.text = m
        self.dayLb.text = d
        self.yearLb.text = y
    }
    */
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        self.layer.cornerRadius = 8.0
        
        self.bottomView.layer.borderWidth = 1.0
        self.bottomView.layer.borderColor = FlatGrayDark().cgColor
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "DateView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }

}
