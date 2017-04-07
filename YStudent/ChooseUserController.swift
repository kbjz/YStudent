//
//  ChooseUserController.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 03/02/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//
import SwiftHEXColors
import UIKit

extension UIColor {
    static var ynovPink: UIColor  { return UIColor(hexString: "#EC4262")! }
    static var ynovGreen: UIColor { return UIColor(hexString: "#06AA9D")! }
}


class ChooseUserController: UIViewController,UIGestureRecognizerDelegate{
    
    
    @IBOutlet weak var ynovView: UIView!
    @IBOutlet weak var studentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        self.ynovView.backgroundColor = UIColor(hexString: "#06AA9D")
        self.studentView.backgroundColor = UIColor(hexString: "#EC4262")
        
        //add tap reco
        let tapYnov = UITapGestureRecognizer(target: self, action: #selector(handleTapYnov(sender:)))
        tapYnov.delegate = self
        self.ynovView.addGestureRecognizer(tapYnov)
        
        let tapProspect = UITapGestureRecognizer(target: self, action: #selector(handleTapProspect(sender:)))
        tapProspect.delegate = self
        self.studentView.addGestureRecognizer(tapProspect)
        
    }
    
    func handleTapYnov(sender: UITapGestureRecognizer? = nil) {
        self.performSegue(withIdentifier: "showYnovMode", sender: self)
    }
    
    func handleTapProspect(sender: UITapGestureRecognizer? = nil) {
        self.performSegue(withIdentifier: "showStudentMode", sender: self)
    }
}

/*extension UIViewController {
    func addGestureToChangeUser {
        let tap = UIGestureRecognizer(target: self.view, action: Selector("handleLongTap")
    }
}
 */
