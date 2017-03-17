//
//  Student.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 03/02/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//
import RealmSwift
import Realm
import UIKit

@objc enum Gender : Int{
    case Male
    case Female
    case null
}

@objc enum CourseType : Int {
    case initial
    case alternance
}
@objc enum SocialNetwork: Int {
    case facebook
    case linkedIn
    case viadeo
    case twitter
}
class Student : Object {
    
    dynamic var lastName : String   = "Doe"
    dynamic var firstName : String  = "John"
    dynamic var birthdate : Date    = Date()
    //var gender : Gender
    dynamic var mail : String       = "doe@mail.com"
    dynamic var address : String    = "12 rue doe"
    dynamic var phone : Int         = 0676456345
    dynamic var picture : String    = "url/picture"
    dynamic var actualSchool : String = "baccaluareat"
  //  dynamic var cursusWanted : Cursus
  //  dynamic var schoolWanted : Campus
    dynamic var experience : String = " 3 stages "
    dynamic var cv : String = "url"
    dynamic var beginningDate : Date = Date()
 //   dynamic var skill : RLMArray   = ["swift","php","oracle"]
    //dynamic var socialAdresses : [SocialNetwork : String]
    dynamic var course : CourseType = CourseType.alternance
    // TO DO
    // parentsName
    // parentPhone
    //
    
    public required init() {
        super.init()
        self.lastName = "Doe"
        self.firstName = "John"
        self.birthdate = Date()
        //self.gender = Gender.null
        self.mail = "what.ever@whatever.com"
        self.address = "whatever street"
        self.phone = 11111111
        self.picture = "/nopicture"
        self.actualSchool = "IUT Whatever"
       // self.cursusWanted = Cursus.null
       // self.schoolWanted = Campus.null
        self.experience = "lorem ipsum"
        self.cv = "whatever.pdf"
        self.beginningDate = Date()
        //self.skill = ["What","Ever"]
        //self.socialAdresses = [SocialNetwork.linkedIn:"whatever.com"]
        self.course = CourseType.alternance
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    
        //fatalError("init(realm:schema:) has not been implemented")
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
        //fatalError("init(value:schema:) has not been implemented")
    }
    
    //
   /* public init(ln : String, fn: String, birth: Date, gender: Gender, mail: String, address: String, phone: Int, picture: String, actualSchool: String, cursusW: Cursus, schoolW: Campus, xp : String, cv: String, begin: Date, skill: [String], social: Dictionary<SocialNetwork, String>,course:CourseType) {
        
        self.lastName = ln
        self.firstName = fn
        self.birthdate = birth
        self.gender = gender
        self.mail = mail
        self.address = address
        self.phone = phone
        self.picture = picture
        self.actualSchool = actualSchool
        self.cursusWanted = cursusW
        self.schoolWanted = schoolW
        self.experience = xp
        self.cv = cv
        self.beginningDate = begin
        self.skill = skill
        self.socialAdresses = social
        self.course = course
    }
*/
    
    
}
