//
//  StudentListController.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 01/03/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit
import ChameleonFramework

class StudentListController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var studentsTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.ynovGreen
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName:UIFont(name:"HelveticaNeue-Light",size:30) as Any]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let d = "25/03/1991"
        let db = "25/03/2008"
        guard let date = dateFormatter.date(from: d) else {return}
        guard let dateB = dateFormatter.date(from: db) else {return}

        let s = Student(ln: "Fucking-Snow de Westeros", fn: "John", birth: date, gender: Gender.Male, mail: "john.snow@gmail.com", address: "2 rue de westeros", phone: 0603045637, picture: "", actualSchool: "Lycée john Doe", cursusW: Cursus.ingesup, schoolW: Campus.aixEnProvence, xp: "beginner", cv: "cv.pdf", begin: dateB, skill: ["c++","uml"], social: [SocialNetwork.linkedIn:"whatever.com"], course: CourseType.alternance)
        
        
        let t = Student(ln: "Martin", fn: "Veronique", birth: date, gender: Gender.Female, mail: "vero.martin2001@gmail.com", address: "2 rue de westeros", phone: 0603045637, picture: "", actualSchool: "Lycée john Doe", cursusW: Cursus.ingesup, schoolW: Campus.aixEnProvence, xp: "beginner", cv: "cv.pdf", begin: dateB, skill: ["c++","uml"], social: [SocialNetwork.linkedIn:"whatever.com"], course: CourseType.alternance)
        StudentManager.sharedInstance.listOfStudents.append(s)
        StudentManager.sharedInstance.listOfStudents.append(t)
        self.studentsTableView.reloadData()
    }
    
    func initialize() {
        self.studentsTableView.delegate = self
        self.studentsTableView.dataSource = self
        studentsTableView.register(UINib(nibName: "StudentCell", bundle: nil), forCellReuseIdentifier: "studentCell")
        studentsTableView.initializePullToRefresh(tint: UIColor.flatWhite, fill: UIColor.ynovGreen)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return StudentManager.sharedInstance.listOfStudents.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                  return 20.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! StudentCell
        let model = StudentManager.sharedInstance.listOfStudents[indexPath.section]
        cell.firstNameLb.text = model.firstName
        cell.lastNameLb.text = model.lastName
        cell.mailLb.text = model.mail
        cell.phoneLb.text = String(model.phone)
        cell.actualLevelLb.text = model.actualSchool
        cell.cursusAskedLb.text = model.cursusWanted.rawValue
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = FlatWhite()
        return headerView
    }

}
