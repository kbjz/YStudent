//
//  PopoverController.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 24/02/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//
import ChameleonFramework
import UIKit


enum stateListOf {
    case Campus
    case Cursus
    case null
}

class PopoverController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let model = EventManager.sharedInstance
    var state = stateListOf.null
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.ynovGreen
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName:UIFont(name:"HelveticaNeue-Light",size:30) as Any]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()

        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        var count = 0
        print("state \(state)")
        guard let e = model.selectedEvent else { return count }
        if state == stateListOf.Campus {
            count = e.campus.count
        } else if state == stateListOf.Cursus {
            count = e.cursus.count
        }
        print(count)
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.0
        } else {
            return 20.0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath) as! labelCell
        guard let e = model.selectedEvent else {return cell }
        if state == stateListOf.Campus {
            cell.nameLb.text = e.campus[indexPath.section].rawValue
        } else if state == stateListOf.Cursus {
             cell.nameLb.text = e.cursus[indexPath.section].rawValue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = FlatGray()
        return headerView
    }

}

class labelCell : UITableViewCell {
    @IBOutlet weak var nameLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8.0
        self.layer.borderColor = UIColor.ynovGreen.cgColor
        self.layer.borderWidth = 1.0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
