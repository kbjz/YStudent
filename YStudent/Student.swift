//
//  Student.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 03/02/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit

enum Gender {
    case Male
    case Female
    case null
}

enum CourseType {
    case initial
    case alternance
}
enum SocialNetwork {
    case facebook
    case linkedIn
    case viadeo
    case twitter
}
class Student: Object {
    
    var lastName : String
    var firstName : String
    var birthdate : Date
    var gender : Gender
    var mail : String
    var address : String
    var phone : Int
    var picture : String
    var actualSchool : String
    var cursusWanted : Cursus
    var schoolWanted : Campus
    var experience : String
    var cv : String
    var beginningDate : Date
    var skill : [String]
    var socialAdresses : [SocialNetwork : String]
    var course : CourseType
    // TO DO
    // parentsName
    // parentPhone
    //
    
    public required init() {
        self.lastName = "Doe"
        self.firstName = "John"
        self.birthdate = Date()
        self.gender = Gender.null
        self.mail = "what.ever@whatever.com"
        self.address = "whatever street"
        self.phone = 11111111
        self.picture = "/nopicture"
        self.actualSchool = "IUT Whatever"
        self.cursusWanted = Cursus.null
        self.schoolWanted = Campus.null
        self.experience = "lorem ipsum"
        self.cv = "whatever.pdf"
        self.beginningDate = Date()
        self.skill = ["What","Ever"]
        self.socialAdresses = [SocialNetwork.linkedIn:"whatever.com"]
        self.course = CourseType.alternance
        super.init()
    }
    
    // TO DO OPTIONNAL
    public init(ln : String, fn: String, birth: Date, gender: Gender, mail: String, address: String, phone: Int, picture: String, actualSchool: String, cursusW: Cursus, schoolW: Campus, xp : String, cv: String, begin: Date, skill: [String], social: Dictionary<SocialNetwork, String>,course:CourseType) {
        
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
        super.init()
        
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    
    
    
}
