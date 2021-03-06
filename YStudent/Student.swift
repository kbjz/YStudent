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
enum Contract : String {
    case pro = "Contrat de professionalisation"
    case intern = "Stage"
    case apprentissage = " Contrat d'apprentissage"
}
enum LevelWanted : String {
    case bachelor = "Bachelor"
    case master = "Mastère"
    case manaa = "MANAA"
    case postBac = "Post-Bac"
    case postBac2 = "Post-Bac + 2"
    case postBac3 = "Post-Bac + 3"
}

enum ProgramWanted : String {
    case bMarket = "Chef de projet marketing et commercial"
    case bComm = "Chef de projet en communication"
    case mManagement = "Management stratégique et international"
    case bSI = "Architecture et systèmes d'informations"
    case mSI = "Expert informatique et systèmes d'informations"
    case manaa = " Mise à niveau en Arts appliqués"
    case bMultimedia = "Infographie et multimédia"
    case mMultimedia = "Chef de produit multimedia"
    case bEmbarque = " Systèmes embarqués"
    case bts = "BTS Audiovisuel"
    case formation6 = "Formation de 6 mois"
    case formation1 = "Formation de 1 à 2 ans"
}

@objc enum CourseType : Int {
    case initial
    case alternance
}

enum ActualCourse : String  {
    case commerce = "Ecole de commerce"
    case lycee = "Lycée"
    case prepa = "Classe préparatoire"
    case universite = "Université"
    case ingenieur = "Ecole d'ingenieur"
    case autre = "Autre"
    
}


@objc enum SocialNetwork: Int {
    case facebook
    case linkedIn
    case viadeo
    case twitter
}
class Student : Object {
    
    // realm object
    
    dynamic var lastName : String   = "Doe"
    dynamic var firstName : String  = "John"
    dynamic var birthdate : Date    = Date()
    dynamic var city :String?
    dynamic var postalCode : String?
    dynamic var isAlreadyInContract : Bool = false
    var actualSchool : ActualCourse?
    var contractType : Contract?
    dynamic var entrepriseName = ""
    //var gender : Gender
    dynamic var mail : String       = "doe@mail.com"
    dynamic var address : String    = "12 rue doe"
    dynamic var phone : Int         = 0676456345
    dynamic var picture : String    = "url/picture"
    //dynamic var actualSchool : String = "baccaluareat"
    var cursusWanted : Cursus?
    var schoolWanted : Campus?
    var levelWanted : LevelWanted?
    var programWanted : ProgramWanted?
    dynamic var actualSchoolName = ""
    dynamic var event : String?
    dynamic var experience : String = " 3 stages "
    dynamic var cv : String = "url"
    dynamic var beginningDate : Date = Date()
    dynamic var course : CourseType = CourseType.alternance
    //realm
    dynamic var cursusWantedString = ""
    dynamic var levelWantedString = ""
    dynamic var schoolWantedString = ""
    dynamic var programWantedString = ""
    dynamic var actualSchoolString = ""
    // TO DO
    // parentsName
    // parentPhone
    //
    
    public required init() {
        super.init()
        
        //realm
        
        self.lastName = ""
        self.firstName = ""
        self.birthdate = Date()
        //self.gender = Gender.null
        self.mail = ""
        self.address = ""
        self.phone = 0
        self.picture = ""
        //self.actualSchool = "IUT Whatever"
        self.cursusWanted = Cursus.null
        self.schoolWanted = Campus.null
        self.experience = ""
        self.cv = ""
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
