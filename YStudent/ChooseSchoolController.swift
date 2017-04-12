//
//  ChooseSchoolController.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 07/04/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit

class ChooseSchoolController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var programCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var levelCollectionView: UICollectionView!
    @IBOutlet weak var nextStepBt: UIButton!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.ynovPink
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName:UIFont(name:"HelveticaNeue-Light",size:30) as Any]
        
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
       
        
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
        
        self.programCollectionView.tag = 2
        self.programCollectionView.allowsMultipleSelection = false
        self.programCollectionView.delegate = self
        self.programCollectionView.dataSource = self
        self.programCollectionView.isHidden = true
        self.programCollectionView.isUserInteractionEnabled = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return EventManager.sharedInstance.listOfCursus.count
        case 1:
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
        case 2:
            if let level = StudentManager.sharedInstance.selectedLevel {
                switch level  {
                    
                case LevelWanted.bachelor:
                    if StudentManager.sharedInstance.selectedSchool == Cursus.isee || StudentManager.sharedInstance.selectedSchool == Cursus.estei {
                        return 2
                    } else {
                        return 1
                    }
                    
                case LevelWanted.master:
                    if StudentManager.sharedInstance.selectedSchool == Cursus.estei {
                        return 2
                    } else {
                        return 1
                    }
                case LevelWanted.manaa:
                    return 1
                    
                case LevelWanted.postBac:
                    return 3
                default:
                    print("default")
                }
            }
        default:
            break
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = UICollectionViewCell()
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "schoolCell", for: indexPath) as! SchoolCollectionCell
            cell.layer.cornerRadius = 8.0
            cell.tag = indexPath.row
            switch indexPath.row {
            // ursus.estei,Cursus.ingesup,Cursus.isee,Cursus.limart,Cursus.eicar,Cursus.idi]
            case 0:
                cell.picture.image = UIImage(named: "estei")
                
            case 1:
                cell.picture.image = UIImage(named: "ingesup")
            case 2:
                cell.picture.image = UIImage(named: "isee")
                
            case 3:
                cell.picture.image = UIImage(named: "limart")
            case 4:
                cell.picture.image = UIImage(named: "eicar")
            case 5:
                cell.picture.image = UIImage(named: "idi")
            default:
                //
                break
            }
            
            return cell
        case 1:
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
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "programCell", for: indexPath) as! ProgramCell
            cell.layer.cornerRadius = 8.0
            cell.layer.borderWidth = 0.8
            cell.layer.borderColor = UIColor.ynovPink.cgColor
            if let level = StudentManager.sharedInstance.selectedLevel {
                switch level  {
                    
                case LevelWanted.bachelor:
                    if let school = StudentManager.sharedInstance.selectedSchool {
                        
                        switch school  {
                        case .isee :
                            cell.bottomLabel.text = StudentManager.sharedInstance.programsIseeB[indexPath.row].rawValue
                        case .ingesup :
                            cell.bottomLabel.text = StudentManager.sharedInstance.programsIngesupB[indexPath.row].rawValue
                        case .estei :
                            cell.bottomLabel.text = StudentManager.sharedInstance.programsEstei[indexPath.row].rawValue
                        case .limart :
                            cell.bottomLabel.text = StudentManager.sharedInstance.programsLimartB[indexPath.row].rawValue
                        default:
                            print("school not found")
                        }
                        return cell
                    }
                case LevelWanted.master:
                    if let school = StudentManager.sharedInstance.selectedSchool {
                        
                        switch school  {
                        case .isee :
                            cell.bottomLabel.text = StudentManager.sharedInstance.programsIseeM[indexPath.row].rawValue
                        case .ingesup :
                            cell.bottomLabel.text = StudentManager.sharedInstance.programsIngesupM[indexPath.row].rawValue
                        case .estei :
                            cell.bottomLabel.text = StudentManager.sharedInstance.programsEstei[indexPath.row].rawValue
                        case .limart :
                            cell.bottomLabel.text = StudentManager.sharedInstance.programsLimartM[indexPath.row].rawValue
                        default:
                            print("school not found")
                        }
                        return cell
                    }
                case LevelWanted.manaa:
                    cell.bottomLabel.text = StudentManager.sharedInstance.programsLimartMa[indexPath.row].rawValue
                    return cell
                case LevelWanted.postBac:
                    cell.bottomLabel.text = StudentManager.sharedInstance.programsEicar[indexPath.row].rawValue
                    return cell
                case LevelWanted.postBac2:
                    break
                case LevelWanted.postBac3:
                    break                }
            }
        default:
            break
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 0:
            
            self.programCollectionView.isUserInteractionEnabled = false
            self.programCollectionView.isHidden = true
            self.nextStepBt.isHidden = true
            self.nextStepBt.isUserInteractionEnabled = false
            self.levelCollectionView.deselectAllItems(animated: true)
            self.programCollectionView.deselectAllItems()
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.handleColorForSelection()
                StudentManager.sharedInstance.selectedSchool = EventManager.sharedInstance.listOfCursus[indexPath.row]
                if StudentManager.sharedInstance.selectedSchool == Cursus.idi {
                    self.nextStepBt.isHidden = false
                    self.nextStepBt.isUserInteractionEnabled = true
                } else {
                    self.levelCollectionView.isHidden = false
                    
                }
                self.levelCollectionView.reloadData()
            }
        case 1:
            
            self.nextStepBt.isHidden = true
            self.nextStepBt.isUserInteractionEnabled = false
            if let cell = collectionView.cellForItem(at: indexPath) {
                let cellTyped = collectionView.cellForItem(at: indexPath) as! LevelCell
                cellTyped.handleColorForSelectState()
                cell.handleColorForSelection()
                self.programCollectionView.deselectAllItems()
                let school = StudentManager.sharedInstance.selectedSchool
                if school  == Cursus.ingesup || school == Cursus.isee || school == Cursus.estei {
                    StudentManager.sharedInstance.selectedLevel = LevelWanted(rawValue: StudentManager.sharedInstance.bachelorMastere[indexPath.row])
                    
                }
                if school == Cursus.limart {
                    StudentManager.sharedInstance.selectedLevel = LevelWanted(rawValue: StudentManager.sharedInstance.bachelorMastereManaa[indexPath.row])
                }
                if school == Cursus.eicar {
                    StudentManager.sharedInstance.selectedLevel = LevelWanted(rawValue: StudentManager.sharedInstance.postBac[indexPath.row])
                    if StudentManager.sharedInstance.selectedLevel == LevelWanted.postBac2 || StudentManager.sharedInstance.selectedLevel == LevelWanted.postBac3 {
                        self.nextStepBt.isHidden = false
                        self.nextStepBt.isUserInteractionEnabled = true
                    }
                }
                
            }
            self.programCollectionView.isHidden = false
            self.programCollectionView.isUserInteractionEnabled = true
            self.programCollectionView.reloadData()
        case 2:
            
            if let cell = collectionView.cellForItem(at: indexPath) {
                let cellTyped = collectionView.cellForItem(at: indexPath) as! ProgramCell
                cellTyped.handleColorForSelectState()
                cell.handleColorForSelection()
                self.nextStepBt.isHidden = false
                self.nextStepBt.isUserInteractionEnabled = true
            }
        default:
            print("wired")
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 || collectionView.tag == 0 {
            self.nextStepBt.isHidden = true
            self.nextStepBt.isUserInteractionEnabled = false
        }
        if collectionView.tag == 1 {
            let cellTyped = collectionView.cellForItem(at: indexPath) as! LevelCell
            cellTyped.handleColorForDeselectState()
        }
        
        if collectionView.tag == 0 {
            self.programCollectionView.isUserInteractionEnabled = false
            self.programCollectionView.isHidden = true
            
        }
        if collectionView.tag == 2 {
            let cellTyped = collectionView.cellForItem(at: indexPath) as! ProgramCell
            cellTyped.handleColorForDeselectState()
        }
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderColor = UIColor.ynovPink.cgColor
            cell.layer.backgroundColor = UIColor.clear.cgColor
        }
        
        
        
        
        // }
    }
    
    
    
    
    @IBAction func nextStepTapped(_ sender: Any) {
        // update creating User
        StudentManager.sharedInstance.creatingStudent?.cursusWanted = StudentManager.sharedInstance.selectedSchool
        StudentManager.sharedInstance.creatingStudent?.levelWanted = StudentManager.sharedInstance.selectedLevel
        StudentManager.sharedInstance.creatingStudent?.programWanted = StudentManager.sharedInstance.selectedProgram
        // save Realm
        
    }
    
}

extension UICollectionViewCell {
    func handleColorForSelection() {
        self.layer.borderColor = UIColor.ynovGreen.cgColor
        self.layer.backgroundColor = UIColor.ynovGreen.cgColor
        
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
            if let cell = self.cellForItem(at: indexPath) as? contractCell {
                cell.titleContract.textColor = UIColor.flatBlack
            }
            if let cell = self.cellForItem(at: indexPath) as? binaryCell {
                cell.titleLb.textColor = UIColor.flatBlack
            }
            if let cell = self.cellForItem(at: indexPath) as? LevelCell {
                cell.title.textColor = UIColor.flatBlack
            }
            if let cell = self.cellForItem(at: indexPath) as? ProgramCell {
                cell.bottomLabel.textColor = UIColor.flatBlack
            }
        }
        self.reloadData()
    }
}



class LevelCell : UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    
    func handleColorForSelectState() {
        self.title.textColor = UIColor.flatWhite
    }
    
    func handleColorForDeselectState() {
        self.title.textColor = UIColor.flatBlack
    }
}


class ProgramCell : UICollectionViewCell {
    
    
    @IBOutlet weak var bottomLabel: UILabel!
    func handleColorForSelectState() {
        
        self.bottomLabel.textColor = UIColor.flatWhite
    }
    func handleColorForDeselectState() {
        
        self.bottomLabel.textColor = UIColor.flatBlack
    }
}


