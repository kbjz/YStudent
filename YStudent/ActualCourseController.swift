//
//  ActualCourseController.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 12/04/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit

class ActualCourseController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.ynovGreen
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName:UIFont(name:"HelveticaNeue-Light",size:30) as Any]
    }


    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var preciseTf: UITextField!
    @IBOutlet weak var nextStepBt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
        
    }
    
    func initialize() {
        self.preciseTf.isHidden = false
        self.preciseTf.isUserInteractionEnabled = true
        self.nextStepBt.isHidden = false
        self.nextStepBt.isUserInteractionEnabled = true
        self.nextStepBt.layer.cornerRadius = 8.0
        self.nextStepBt.layer.backgroundColor = UIColor.ynovPink.cgColor
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.allowsMultipleSelection = false
        self.preciseTf.layer.borderWidth = 0.4
        self.preciseTf.layer.borderColor = UIColor.ynovPink.cgColor
        self.preciseTf.layer.cornerRadius = 8.0
    }


    @IBAction func nextTapped(_ sender: Any) {
        //update Creating User
        
        if StudentManager.sharedInstance.creatingStudent != nil {
            StudentManager.sharedInstance.creatingStudent?.actualSchool = StudentManager.sharedInstance.selectedActualSchool
            if let t = self.preciseTf.text {
                StudentManager.sharedInstance.creatingStudent?.actualSchoolName = t
            }
            
        } else {
            let u = Student()
            u.actualSchool = StudentManager.sharedInstance.selectedActualSchool
            if let t = self.preciseTf.text {
                u.actualSchoolName = t
            }
            StudentManager.sharedInstance.creatingStudent = u

        }
        
      
    }
    

}

extension ActualCourseController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = self.collectionView.cellForItem(at: indexPath) as? ActualCourseCell {
            cell.handleColorForSelection()
            cell.handleColorForSelectState()
            StudentManager.sharedInstance.selectedActualSchool = ActualCourse(rawValue: StudentManager.sharedInstance.actualCourse[indexPath.item])
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = self.collectionView.cellForItem(at: indexPath) as? ActualCourseCell {
            cell.layer.borderColor = UIColor.ynovPink.cgColor
            cell.layer.backgroundColor = UIColor.clear.cgColor
            cell.handleColorForDeselectState()
        }
        
        //
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "actualCourseCell", for: indexPath) as! ActualCourseCell
        cell.layer.cornerRadius = 8.0
        cell.layer.borderWidth = 0.8
        cell.layer.borderColor = UIColor.ynovPink.cgColor
        cell.title.text = StudentManager.sharedInstance.actualCourse[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StudentManager.sharedInstance.actualCourse.count
    }
    
}


class ActualCourseCell : UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    
    func handleColorForSelectState() {
        
        self.title.textColor = UIColor.flatWhite
    }
    func handleColorForDeselectState() {
        
        self.title.textColor = UIColor.flatBlack
    }

    
}

