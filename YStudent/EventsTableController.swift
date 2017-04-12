//
//  EventsTableController.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 23/02/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//
import DGElasticPullToRefresh
import ChameleonFramework
import UIKit

enum EventState {
    case toModify
    case toAdd
    case null
}

class EventsTableController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var eventsTableView: UITableView!
    var eventState = EventState.toAdd
    
    override func handleLongTap(sender: UILongPressGestureRecognizer?) {
        NotificationCenter.default.removeObserver(self,
                                                            name: NSNotification.Name.UIContentSizeCategoryDidChange,
                                                            object: nil)
    self.navigationController?.popToRootViewController(animated: false)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.addGestureToChangeUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.ynovGreen
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName:UIFont(name:"HelveticaNeue-Light",size:30) as Any]
        self.eventsTableView.reloadData()
    }
    func initialize() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let d = "25/12/2017"
        guard let date = dateFormatter.date(from: d) else {return}
        let e = Event(location: "paris 12", reason: "Session d'immersion", cursus: [Cursus.ingesup,Cursus.isee] , campus: [Campus.aixEnProvence,Campus.toulouse,Campus.bordeaux,Campus.paris,Campus.lyon], begin: date, duration: Duration.oneWeek, isYnov: YnovReason.ImmersiveSession)
        EventManager.sharedInstance.addEvent(e: e)
        let e1 = Event(location: "Aix en provence ", reason: "Salon de l'etudiant", cursus: [Cursus.ingesup,Cursus.isee] , campus: [Campus.aixEnProvence,Campus.bordeaux], begin: date, duration: Duration.oneWeek, isYnov: YnovReason.ImmersiveSession)
        EventManager.sharedInstance.addEvent(e: e1)
        let e2 = Event(location: "paris 20", reason:"Portes ouvertes", cursus: [Cursus.ingesup,Cursus.isee] , campus: [Campus.aixEnProvence,Campus.paris], begin: date, duration: Duration.oneWeek, isYnov: YnovReason.ImmersiveSession)
        EventManager.sharedInstance.addEvent(e: e2)
        eventsTableView.register(UINib(nibName: "EventCell", bundle: nil), forCellReuseIdentifier: "eventCell")
        
        self.eventsTableView.initializePullToRefresh(tint: UIColor.flatWhite, fill: UIColor.ynovGreen)
        self.eventsTableView.delegate = self
        self.eventsTableView.dataSource = self
        self.eventsTableView.reloadData()
        
      
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
        
        
        

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return EventManager.sharedInstance.listOfEvents.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 20.0
        /* if section == 0 {
            return 0.0
        } else {
            return 20.0
        }
 */
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventCell
        let events = EventManager.sharedInstance.listOfEvents
        
        //handle button in cell
        cell.campusBt.tag = indexPath.section
        cell.campusBt.addTarget(self, action: #selector(campusButtonTapped(sender:)), for: .touchUpInside)
        cell.cursusBt.tag = indexPath.section
        cell.cursusBt.addTarget(self, action: #selector(cursusButtonTapped(sender:)), for: .touchUpInside)
        
        cell.reason.text = events[indexPath.section].reason
        cell.location.text = events[indexPath.section].location
        cell.dateView.monthLb.text = Date.getFrenchMonth(m: events[indexPath.section].beginningDate.month)
        cell.dateView.yearLb.text = events[indexPath.section].beginningDate.year
        cell.dateView.dayLb.text = events[indexPath.section].beginningDate.day
        
        return cell
    }
    
    func cursusButtonTapped(sender:UIButton) {
        for i in  0...EventManager.sharedInstance.listOfEvents.count {
            if sender.tag == i {
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "popoverController") as? PopoverController {
                    EventManager.sharedInstance.selectedEvent = EventManager.sharedInstance.listOfEvents[i]
                    vc.state = stateListOf.Cursus
                    vc.modalPresentationStyle = .popover
                    vc.popoverPresentationController?.sourceView = sender
                    vc.popoverPresentationController?.sourceRect = (sender.titleLabel?.frame)!
                    self.present(vc, animated: true, completion: nil)
                }
            }
        }
    }
    
    func campusButtonTapped(sender:UIButton) {
        for i in  0...EventManager.sharedInstance.listOfEvents.count {
            if sender.tag == i {
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "popoverController") as? PopoverController {
                EventManager.sharedInstance.selectedEvent = EventManager.sharedInstance.listOfEvents[i]
                vc.state = stateListOf.Campus
                vc.modalPresentationStyle = .popover
                vc.popoverPresentationController?.sourceView = sender
                vc.popoverPresentationController?.sourceRect = (sender.titleLabel?.frame)!
                self.present(vc, animated: true, completion: nil)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = FlatWhite()
        return headerView
    }
 
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let modify = UITableViewRowAction(style: .normal, title: "Modifier") { action, index in
            self.modifyTapped(index: index)
        }
        modify.backgroundColor = UIColor.ynovPink
        let delete = UITableViewRowAction(style: .normal, title: "Supprimer") { action, index in
            self.deleteTapped(index: index)
        }
        delete.backgroundColor = UIColor.ynovGreen
        
        return [modify, delete]
    }
    
    func modifyTapped(index:IndexPath) {
        self.eventState = .toModify
        EventManager.sharedInstance.selectedEvent = EventManager.sharedInstance.listOfEvents[index.section]
        self.performSegue(withIdentifier:"addEventSegue", sender: self)
    }
    func deleteTapped(index:IndexPath) {
        EventManager.sharedInstance.listOfEvents.remove(at: index.section)
        self.eventsTableView.reloadData()
    }
    
 
    // MARK Navigation
    
    @IBAction func prepareForUnwind(_ sender: UIStoryboardSegue) {
    // unwind from adding event
        self.eventsTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addEventSegue" && self.eventState == .toModify {
            let nextScene = segue.destination as? AddEventController
            nextScene?.eventState = self.eventState
            self.eventState = .toAdd
        }
    }
}

extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        return dateFormatter.string(from: self)
    }
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self)
    }
    
    static func toString(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: date)
    }
    
    // TO DO correct this
    static func getFrenchMonth(m : String)  -> String{
        let months = ["Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Août","Septembre","Octobre","Novembre","Décembre"]
        var str : String = ""
        
        for i in 0...months.count - 1 {
            guard let n = Int(m)   else { return "error string to int month"}
            if n - 1 == i {
                str = months[i]
                return str
            } else {
                str = "Month not found"
            }
        }
        return str
    }
    
    
    
}

extension UITableView {
    
    func initializePullToRefresh(tint : UIColor,fill : UIColor) {
        // Initialize tableView
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = tint
        self.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            self?.reloadData()
            self?.dg_stopLoading()
            }, loadingView: loadingView)
        self.dg_setPullToRefreshFillColor(fill)
        self.dg_setPullToRefreshBackgroundColor(self.backgroundColor!)
    }

}
