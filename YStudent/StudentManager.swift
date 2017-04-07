//
//  StudentManager.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 01/03/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit

class StudentManager: NSObject {

    static let sharedInstance = StudentManager()
    
    var listOfStudents = {
        RealmManager.sharedInstance.getListOfStudents()
    }
    var creatingStudent : Student?
    var selectedSchool : Cursus?
  //  var selectedLevel : LevelWanted
    
    var bachelorMastere  = ["Bachelor","Mastère"]
    var bachelorMastereManaa  = ["Bachelor","Mastère","MANAA"]
    var postBac  = ["Post-Bac","Post-Bac + 2","Post-Bac + 3"]
    
}
