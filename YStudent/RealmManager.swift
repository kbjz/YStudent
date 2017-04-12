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
       // if let r = self.realm {
            try! realm.write {
                realm.add(s)
         //   }
        }
        
    }
    
    func fillStringWith(student:Student) -> Student {
        guard let c = student.cursusWanted else {return student}
        guard let s = student.schoolWanted else {return student}
        guard let l = student.levelWanted else {return student}
        guard let p = student.programWanted else {return student}
        guard let school = student.actualSchool else {return student}
        student.cursusWantedString = c.rawValue
        student.schoolWantedString = s.rawValue
        student.levelWantedString = l.rawValue
        student.programWantedString = p.rawValue
        student.actualSchoolString = school.rawValue
        
        return student
    }
    
    // get LIst of student
    func getListOfStudents() -> Results<Student>{
        return self.realm.objects(Student.self)
    }

}
