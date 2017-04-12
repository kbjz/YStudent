//
//  EntrepriseController.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 09/04/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit

class EntrepriseController: UIViewController {
    @IBOutlet weak var contractCollectionView: UICollectionView!
    @IBOutlet weak var nextStepBt: UIButton!
    @IBOutlet weak var entrepriseNameTf: UITextField!
    @IBOutlet weak var yesNoCollectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.barTintColor = UIColor.ynovPink
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName:UIFont(name:"HelveticaNeue-Light",size:30) as Any]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
        
        
    }
    
    func initialize() {
        self.initialize(collectionView: self.yesNoCollectionView, tag: 0)
        self.initialize(collectionView: self.contractCollectionView, tag: 1)
        self.nextStepBt.isHidden = true
        self.nextStepBt.isUserInteractionEnabled = false
        
        self.nextStepBt.layer.cornerRadius = 8.0
        self.nextStepBt.layer.backgroundColor = UIColor.ynovPink.cgColor
    }
    
    func initialize(collectionView : UICollectionView , tag : Int) {
        collectionView.delegate = self
        collectionView.dataSource = self
        self.entrepriseNameTf.layer.borderWidth = 0.4
        self.entrepriseNameTf.layer.borderColor = UIColor.ynovPink.cgColor
        //collectionView.layer.borderColor = UIColor.ynovPink.cgColor
        collectionView.tag = tag
    }
    
    
    @IBAction func nextStepTapped(_ sender: Any) {
        if let e = StudentManager.sharedInstance.hasEntreprise {
            StudentManager.sharedInstance.creatingStudent?.isAlreadyInContract = e
        }
        
        StudentManager.sharedInstance.creatingStudent?.contractType = StudentManager.sharedInstance.contractSelected
        
        if let n = StudentManager.sharedInstance.entrepriseName {
            StudentManager.sharedInstance.creatingStudent?.entrepriseName = n
        }
        
               
        
    }
    
    
}

class binaryCell : UICollectionViewCell {
    @IBOutlet weak var titleLb: UILabel!
    func handleColorForSelectState() {
        self.titleLb.textColor = UIColor.flatWhite
    }
    
    func handleColorForDeselectState() {
        self.titleLb.textColor = UIColor.flatBlack
    }
    
}

class contractCell : UICollectionViewCell {
    @IBOutlet weak var titleContract: UILabel!
    func handleColorForSelectState() {
        self.titleContract.textColor = UIColor.flatWhite
    }
    
    func handleColorForDeselectState() {
        self.titleContract.textColor = UIColor.flatBlack
    }
    
}

extension EntrepriseController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:
        IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 0:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "binaryCell", for: indexPath) as? binaryCell {
                cell.layer.cornerRadius = 8.0
                cell.layer.borderWidth = 0.8
                cell.layer.borderColor = UIColor.ynovPink.cgColor
                cell.tag = indexPath.row
                cell.titleLb.text = StudentManager.sharedInstance.yesNo[indexPath.row]
                return cell
                
            }
            
        case 1:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contractCell", for: indexPath) as? contractCell {
                cell.layer.cornerRadius = 8.0
                cell.layer.borderWidth = 0.8
                cell.layer.borderColor = UIColor.ynovPink.cgColor
                cell.titleContract.text = StudentManager.sharedInstance.contracts[indexPath.row].rawValue
                return cell
            }
            
        default :
            break
        }
        let cell = UICollectionViewCell()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return 2
        } else {
            return StudentManager.sharedInstance.contracts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 0:
            self.contractCollectionView.deselectAllItems()
            if let cell = collectionView.cellForItem(at: indexPath) as? binaryCell {
                cell.handleColorForSelectState()
                cell.handleColorForSelection()
                
                if cell.titleLb.text == "OUI" {
                    StudentManager.sharedInstance.hasEntreprise = true
                    self.nextStepBt.isHidden = true
                    self.nextStepBt.isUserInteractionEnabled = false
                    self.contractCollectionView.isHidden = false
                    self.contractCollectionView.isUserInteractionEnabled = true
                    self.entrepriseNameTf.isHidden = false
                    self.entrepriseNameTf.isUserInteractionEnabled = true
                    self.contractCollectionView.reloadData()
                } else {
                    StudentManager.sharedInstance.hasEntreprise = false
                    StudentManager.sharedInstance.entrepriseName = nil
                    StudentManager.sharedInstance.contractSelected = nil
                    self.nextStepBt.isHidden = false
                    self.nextStepBt.isUserInteractionEnabled = true
                    self.contractCollectionView.isHidden = true
                    self.contractCollectionView.isUserInteractionEnabled = false
                    self.entrepriseNameTf.isHidden = true
                    self.entrepriseNameTf.isUserInteractionEnabled = false
                }
            }
        case 1:
            StudentManager.sharedInstance.contractSelected = StudentManager.sharedInstance.contracts[indexPath.row]
            if let cell = collectionView.cellForItem(at: indexPath) as? contractCell {
                cell.handleColorForSelection()
                cell.handleColorForSelectState()
            }
            self.nextStepBt.isHidden = false
            self.nextStepBt.isUserInteractionEnabled = true
            
        default :
            break
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderColor = UIColor.ynovPink.cgColor
            cell.layer.backgroundColor = UIColor.clear.cgColor
        }
        switch collectionView.tag {
        case 0:
            if let cellT = collectionView.cellForItem(at: indexPath) as? binaryCell {
                cellT.handleColorForDeselectState()
            }
        case 1:
            if let cellTc = collectionView.cellForItem(at: indexPath) as? contractCell {
                cellTc.handleColorForDeselectState()
            }
            
        default :
            break
        }
        
    }
}


