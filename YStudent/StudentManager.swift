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
    
}
