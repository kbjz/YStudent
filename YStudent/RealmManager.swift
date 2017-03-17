//
//  RealmManager.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 17/03/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//
import Realm
import RealmSwift
import UIKit

class RealmManager: NSObject {
    
    // singleton
    static let sharedInstance = RealmManager()
    let realm = try! Realm()
    
    //store a Student
    func store(s:Student) {
        try! self.realm.write {
            realm.add(s)
        }
    }
    
    // get LIst of student
    func getListOfStudents() -> Results<Student>{
        return self.realm.objects(Student.self)
    }

}
