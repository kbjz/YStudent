//
//  TreeViewController.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 17/03/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit

class TreeViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.ynovPink
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName:UIFont(name:"HelveticaNeue-Light",size:30) as Any]
    }

    enum CreationState {
        case toCreate
        case onCreation
    }
    
    @IBOutlet weak var createProspect: UIButton!
    @IBOutlet weak var actualCursus: UIButton!
    @IBOutlet weak var enterpriseBt: UIButton!
    @IBOutlet weak var cursusChoiceBt: UIButton!
    @IBOutlet weak var civilityBt: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    
    var state = CreationState.toCreate
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
    
    @IBAction func changeModeTapped(_ sender: Any) {
        if self.state == .onCreation {
            self.view.makeToast(<#T##message: String##String#>, duration: <#T##TimeInterval#>, position: <#T##CGPoint#>)
        }
    }
    
    func initialize() {
        self.civilityBt.alpha = 0
        self.actualCursus.alpha = 0
        self.cursusChoiceBt.alpha = 0
        self.enterpriseBt.alpha = 0
        self.customButton(bt: self.enterpriseBt)
        self.customButton(bt: self.cursusChoiceBt)
        self.customButton(bt: self.civilityBt)
        self.customButton(bt: self.actualCursus)
        self.customButton(bt: self.createProspect)
        self.backgroundView.backgroundColor = UIColor.ynovPink
        self.createProspect.setTitle("Créer un prospect", for: .normal)
        //self.createProspect.setTitleColor(UIColor.ynovPink for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createTapped(_ sender: Any) {
        if self.state == .onCreation {
            if let s = StudentManager.sharedInstance.creatingStudent {
                RealmManager.sharedInstance.store(s:RealmManager.sharedInstance.fillStringWith(student:s ))
                StudentManager.sharedInstance.creatingStudent = nil
            }

            self.state = .toCreate
        } else {
            self.state = .onCreation
        }
        
        switch self.state {
        case .onCreation:
             self.createProspect.setTitle("Sauvegarder prospect", for: .normal)
            UIView.animate(withDuration: 1.5) {
                self.civilityBt.alpha = 1.0
                self.actualCursus.alpha = 1.0
                self.cursusChoiceBt.alpha = 1.0
                self.enterpriseBt.alpha = 1.0
                self.civilityBt.isUserInteractionEnabled = true
                self.actualCursus.isUserInteractionEnabled = true
                self.cursusChoiceBt.isUserInteractionEnabled = true
                self.enterpriseBt.isUserInteractionEnabled = true
            }
        case .toCreate:
             self.createProspect.setTitle("Créer un prospect", for: .normal)
            UIView.animate(withDuration: 1.5) {
                self.civilityBt.alpha = 0
                self.actualCursus.alpha = 0
                self.cursusChoiceBt.alpha = 0
                self.enterpriseBt.alpha = 0
                self.civilityBt.isUserInteractionEnabled = false
                self.actualCursus.isUserInteractionEnabled = false
                self.cursusChoiceBt.isUserInteractionEnabled = false
                self.enterpriseBt.isUserInteractionEnabled = false
                
            }
            
        }
    }
    // unwind
    @IBAction func prepareForUnwind(_ sender: UIStoryboardSegue) {
        // unwind from adding event
    }
    
    func customButton(bt : UIButton ) {
        bt.layer.cornerRadius = bt.frame.size.width / 2
        bt.layer.borderWidth = 1.0
        bt.layer.borderColor = UIColor.ynovPink.cgColor
        bt.tintColor = UIColor.ynovPink
        bt.backgroundColor = UIColor.flatWhite
    }
}
