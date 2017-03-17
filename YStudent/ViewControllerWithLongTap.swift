//
//  ViewControllerWithLongTap.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 16/03/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit

class ViewControllerWithLongTap: UIViewController , UIGestureRecognizerDelegate{
    
    let longTap = UILongPressGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let timeTap = CFTimeInterval(exactly: 3.0) else {return}
        self.longTap.numberOfTouchesRequired = 3
        self.longTap.minimumPressDuration = timeTap
        self.view.addGestureRecognizer(longTap)
        
        
    }



}
