//
//  ChooseSchoolController.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 07/04/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit

class ChooseSchoolController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var levelCollectionView: UICollectionView!
    @IBOutlet weak var nextStepBt: UIButton!
  
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.barTintColor = UIColor.ynovGreen
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName:UIFont(name:"HelveticaNeue-Light",size:30) as Any]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
        
        // Do any additional setup after loading the view.
    }
    
    func initialize() {
        self.nextStepBt.isHidden = true
        self.nextStepBt.isUserInteractionEnabled = false
        
        self.nextStepBt.layer.cornerRadius = 8.0
        self.nextStepBt.layer.backgroundColor = UIColor.ynovPink.cgColor
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.tag = 0
        self.levelCollectionView.delegate = self
        self.levelCollectionView.dataSource = self
        self.levelCollectionView.tag = 1
        self.collectionView.register(UINib.init(nibName: "schoolCollectionCell", bundle: nil), forCellWithReuseIdentifier: "schoolCell")
        self.collectionView.allowsMultipleSelection = false
        self.levelCollectionView.allowsMultipleSelection = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return EventManager.sharedInstance.listOfCursus.count
        } else {
            let school = StudentManager.sharedInstance.selectedSchool
            if school  == Cursus.ingesup || school == Cursus.isee || school == Cursus.estei {
                return StudentManager.sharedInstance.bachelorMastere.count
            }
            if school == Cursus.limart {
                return StudentManager.sharedInstance.bachelorMastereManaa.count
            }
            if school == Cursus.eicar {
                return StudentManager.sharedInstance.postBac.count
            }
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "schoolCell", for: indexPath) as! SchoolCollectionCell
            cell.layer.cornerRadius = 8.0
            cell.tag = indexPath.row
            switch indexPath.row {
            case 0:
                cell.picture.image = UIImage(named: "ingesup")
            case 1:
                cell.picture.image = UIImage(named: "estei")
            case 2:
                cell.picture.image = UIImage(named: "eicar")
            case 3:
                cell.picture.image = UIImage(named: "limart")
            case 4:
                cell.picture.image = UIImage(named: "isee")
            case 5:
                cell.picture.image = UIImage(named: "idi")
            default:
                //
                break
            }
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "levelCell", for: indexPath) as! LevelCell
            cell.layer.cornerRadius = 8.0
            cell.layer.borderWidth = 0.8
            cell.layer.borderColor = UIColor.ynovPink.cgColor
            let school = StudentManager.sharedInstance.selectedSchool
            if school  == Cursus.ingesup || school == Cursus.isee || school == Cursus.estei {
                cell.title.text = StudentManager.sharedInstance.bachelorMastere[indexPath.row]
            }
            if school == Cursus.limart {
                cell.title.text = StudentManager.sharedInstance.bachelorMastereManaa[indexPath.row]
            }
            if school == Cursus.eicar {
                cell.title.text = StudentManager.sharedInstance.postBac[indexPath.row]
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            self.nextStepBt.isHidden = true
            self.nextStepBt.isUserInteractionEnabled = false
            self.levelCollectionView.deselectAllItems(animated: true)
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.layer.borderColor = UIColor.ynovGreen.cgColor
                cell.layer.backgroundColor = UIColor.ynovGreen.cgColor
                StudentManager.sharedInstance.selectedSchool = EventManager.sharedInstance.listOfCursus[indexPath.row]
                if StudentManager.sharedInstance.selectedSchool == Cursus.idi {
                    self.nextStepBt.isHidden = false
                    self.nextStepBt.isUserInteractionEnabled = true
                } else {
                    self.levelCollectionView.isHidden = false
                    
                }
                self.levelCollectionView.reloadData()
               
            }
        } else {
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.layer.borderColor = UIColor.ynovGreen.cgColor
                cell.layer.backgroundColor = UIColor.ynovGreen.cgColor
                self.nextStepBt.isHidden = false
                self.nextStepBt.isUserInteractionEnabled = true
                
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
         if collectionView.tag == 1 {
            self.nextStepBt.isHidden = true
            self.nextStepBt.isUserInteractionEnabled = false
        }
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderColor = UIColor.ynovPink.cgColor
            cell.layer.backgroundColor = UIColor.clear.cgColor
        }
        
        // }
    }
    
    @IBAction func nextStepTapped(_ sender: Any) {
        // update creating User
        //StudentManager.sharedInstance.creatingStudent?.schoolWanted =
        // save Realm
        
    }
    
}




extension UICollectionView {
    
    func deselectAllItems(animated: Bool = false) {
        for indexPath in self.indexPathsForSelectedItems ?? [] {
            self.deselectItem(at: indexPath, animated: animated)
            if let cell = self.cellForItem(at: indexPath) {
                cell.layer.borderColor = UIColor.ynovPink.cgColor
                cell.layer.backgroundColor = UIColor.clear.cgColor
            }
        }
    }
}



class LevelCell : UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
}


