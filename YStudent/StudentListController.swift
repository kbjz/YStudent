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
    let model = StudentManager.sharedInstance
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.ynovGreen
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName:UIFont(name:"HelveticaNeue-Light",size:30) as Any]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
        
        self.studentsTableView.reloadData()
    }
    
    func initialize() {
        self.studentsTableView.delegate = self
        self.studentsTableView.dataSource = self
        studentsTableView.register(UINib(nibName: "StudentCell", bundle: nil), forCellReuseIdentifier: "studentCell")
        studentsTableView.initializePullToRefresh(tint: UIColor.flatWhite, fill: UIColor.ynovGreen)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.model.listOfStudents().count
        //return StudentManager.sharedInstance.listOfStudents.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                  return 20.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! StudentCell
        let model = self.model.listOfStudents()[indexPath.section]
        cell.firstNameLb.text = model.firstName
        cell.lastNameLb.text = model.lastName
        cell.mailLb.text = model.mail
        cell.phoneLb.text = String(model.phone)
        cell.actualLevelLb.text = model.actualSchool
        //cell.cursusAskedLb.text = model.cursusWanted.rawValue
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = FlatWhite()
        return headerView
    }

}
