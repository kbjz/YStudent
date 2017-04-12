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


class ChooseUserController: UIViewController{
    
    
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
    
    @IBAction func prepareForUnwindToInitial(segue: UIStoryboardSegue){
        
    }
}

extension UIViewController : UIGestureRecognizerDelegate {
    func addGestureToChangeUser() {
        let tap = UILongPressGestureRecognizer(target: self, action: #selector(handleLongTap(sender:)))
        guard let timeTap = CFTimeInterval(exactly: 3.0) else {return}
        tap.numberOfTouchesRequired = 2
        tap.minimumPressDuration = timeTap
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
    }
    func handleLongTap(sender: UILongPressGestureRecognizer? = nil) {
        self.navigationController?.popToRootViewController(animated: false)
    }
 
}

