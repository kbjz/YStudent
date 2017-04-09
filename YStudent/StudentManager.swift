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
    let contracts = [Contract.intern,Contract.pro,Contract.apprentissage]
    let programsIseeB = [ProgramWanted.bComm,ProgramWanted.bMarket]
    let programsIseeM = [ProgramWanted.mManagement]
    let programsIngesupB = [ProgramWanted.bSI]
    let programsIngesupM = [ProgramWanted.mSI]
    let programsEstei = [ProgramWanted.bMultimedia,ProgramWanted.bEmbarque]
    let programsLimartMa = [ProgramWanted.manaa]
    let programsLimartB = [ProgramWanted.bMultimedia]
    let programsLimartM = [ProgramWanted.mMultimedia]
    let programsEicar = [ProgramWanted.formation1,ProgramWanted.bts,ProgramWanted.formation6]
    var creatingStudent : Student?
    var selectedSchool : Cursus?
    var selectedLevel : LevelWanted?
    var selectedProgram : ProgramWanted?
    let yesNo = ["OUI","NON"]
    
    var hasEntreprise : Bool?
    var contractSelected : Contract?
    var entrepriseName : String?
    
    var bachelorMastere  = [LevelWanted.bachelor.rawValue,LevelWanted.master.rawValue]
    var bachelorMastereManaa  = [LevelWanted.bachelor.rawValue,LevelWanted.master.rawValue,LevelWanted.manaa.rawValue]
    var postBac  = [LevelWanted.postBac.rawValue,LevelWanted.postBac2.rawValue,LevelWanted.postBac3.rawValue]
    
}
