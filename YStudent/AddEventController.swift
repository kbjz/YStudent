//
//  AddEventController.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 15/02/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//
import UIKit
import QuartzCore
import SwiftHEXColors
import IQKeyboardManagerSwift

enum State {
    case Campus
    case Cursus
    case YnovReason
    case null
}


class AddEventController: ViewControllerWithLongTap ,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.ynovGreen
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName:UIFont(name:"HelveticaNeue-Light",size:30) as Any]
        
    }
    // TO DO fusion toolbar
    // UI
    @IBOutlet weak var duration: UITextField!
    @IBOutlet weak var labelSwitch: UILabel!
    @IBOutlet weak var switchYnov: UISwitch!
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var validateEventBt: UIButton!
    @IBOutlet weak var tableFrame: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var reasonTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var campusTF: UITextField!
    @IBOutlet weak var cursusTF: UITextField!
    var tableView = UITableView()
    var durationPicker = UIPickerView()
    var state = State.null
    var datePicker = UIDatePicker()
    var eventState = EventState.null
    
    @IBOutlet weak var topConstraintTableFrame: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.initializeTableView()
        self.initializeDatePicker()
        self.initializeDurationPicker()
        IQKeyboardManager.sharedManager().enable = true
        if self.eventState == .toModify {
            if let e = EventManager.sharedInstance.selectedEvent {
                self.handleModifying(event:e)
            }
        } else {
            self.title = "Ajouter un évenement"
        }
    }
    
    func cleanViewModel() {
        EventManager.sharedInstance.selectedEvent = nil
        EventManager.sharedInstance.cursusSelected.removeAll()
        EventManager.sharedInstance.campusSelected.removeAll()
        EventManager.sharedInstance.durationSelected = Duration.null
    }
    
    @IBAction func validateTapped(_ sender: Any) {
        guard let d = dateTF.text else {return}
        //formatting date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        guard let date = dateFormatter.date(from: d) else {return}
        guard let location = locationTF.text else {return}
        guard let reason = reasonTF.text else {return}
        
        
        if self.eventState == .toModify {
            if let e = EventManager.sharedInstance.selectedEvent {
                EventManager.sharedInstance.listOfEvents.remove(object: e)
            }
        }
        let createdEvent = Event(location: location, reason: reason, cursus: EventManager.sharedInstance.cursusSelected, campus: EventManager.sharedInstance.campusSelected, begin: date, duration: EventManager.sharedInstance.durationSelected, isYnov: YnovReason.null)
        EventManager.sharedInstance.addEvent(e: createdEvent)
        
    }
    
    
    func initializeUI (){
        
        self.tableFrame.backgroundColor = UIColor.clear
        
        self.reasonTF.layer.borderColor = UIColor.ynovGreen.cgColor
        self.reasonTF.layer.borderWidth = 1.5
        self.reasonTF.layer.cornerRadius = 4.0
        
        self.locationTF.layer.borderColor = UIColor.ynovGreen.cgColor
        self.locationTF.layer.borderWidth = 1.5
        self.locationTF.layer.cornerRadius = 4.0
        self.locationTF.delegate = self
        
        self.campusTF.layer.borderColor = UIColor.ynovGreen.cgColor
        self.campusTF.layer.borderWidth = 1.5
        self.campusTF.layer.cornerRadius = 4.0
        self.campusTF.delegate = self
        
        self.cursusTF.layer.borderColor = UIColor.ynovGreen.cgColor
        self.cursusTF.layer.borderWidth = 1.5
        self.cursusTF.layer.cornerRadius = 4.0
        self.cursusTF.delegate = self
        
        self.dateTF.layer.borderColor = UIColor.ynovGreen.cgColor
        self.dateTF.layer.borderWidth = 1.5
        self.dateTF.layer.cornerRadius = 4.0
        self.dateTF.delegate = self
        
        self.duration.layer.borderColor = UIColor.ynovGreen.cgColor
        self.duration.layer.borderWidth = 1.5
        self.duration.layer.cornerRadius = 4.0
        self.duration.delegate = self
        
        self.validateEventBt.layer.borderWidth = 1.5
        self.validateEventBt.layer.cornerRadius = 4.0
        self.validateEventBt.backgroundColor = UIColor.ynovGreen
        self.validateEventBt.layer.borderWidth = 1.5
        self.validateEventBt.layer.borderColor = UIColor.ynovGreen.cgColor
        self.validateEventBt.tintColor = UIColor.white
        
        self.switchYnov.addTarget(self, action: #selector(switchChanged(sender:)), for: UIControlEvents.valueChanged)
        
        self.tableFrame.isUserInteractionEnabled = false
        self.view.bringSubview(toFront: self.validateEventBt)
    }
    
    func switchChanged(sender:UISwitch) {
        /* if sender.isOn {
         //self.locationTF.inputView = tableView
         self.locationTF.becomeFirstResponder()
         
         } else {
         self.locationTF.inputView = nil
         self.locationTF.resignFirstResponder()
         }
         */
    }
    
    func initializeTableView() {
        tableView = UITableView(frame: self.tableFrame.frame, style:UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CampusCell", bundle: nil), forCellReuseIdentifier: "campusCell")
        tableView.separatorStyle = .none
        tableView.rowHeight = 100
        tableView.allowsMultipleSelection = true
        self.campusTF.inputView = tableView
        self.cursusTF.inputView = tableView
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.ynovGreen
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTableView(sender:)))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTableView(sender:)))
        let selectAll = UIBarButtonItem(title: "Tout sélectionner", style: .plain, target: self, action: #selector(selectAllTableView(sender:)))
        
        
        toolBar.setItems([cancelButton, doneButton,selectAll], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        
        self.campusTF.inputAccessoryView = toolBar
        self.cursusTF.inputAccessoryView = toolBar
        
    }
    
    func selectAllTableView(sender : UIBarButtonItem) {
        //TO DO
        /* if self.campusTF.isFirstResponder {
         self.campusTF.resignFirstResponder()
         } else if self.cursusTF.isFirstResponder {
         self.cursusTF.resignFirstResponder()
         }
         */
        
    }
    func doneTableView(sender : UIBarButtonItem) {
        if self.campusTF.isFirstResponder {
            self.campusTF.resignFirstResponder()
        } else if self.cursusTF.isFirstResponder {
            self.cursusTF.resignFirstResponder()
        }
    }
    
    func cancelTableView(sender : UIBarButtonItem) {
        if self.campusTF.isFirstResponder {
            self.campusTF.text = ""
            self.campusTF.resignFirstResponder()
        } else if self.cursusTF.isFirstResponder {
            self.cursusTF.text = ""
            self.cursusTF.resignFirstResponder()
        }
        
    }
    
    //MARK : TABLE VIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.state == .Campus {
            return EventManager.sharedInstance.listOfCampus.count
        } else if self.state == .Cursus {
            return EventManager.sharedInstance.listOfCursus.count
        } else {
            return EventManager.sharedInstance.listOfYnovReason.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "campusCell", for: indexPath) as! CampusCell
        if self.state == .Campus {
            tableView.allowsMultipleSelection = true
            cell.campus = EventManager.sharedInstance.listOfCampus[indexPath.row]
            cell.name.text = cell.campus.rawValue
        } else if self.state == .Cursus {
            tableView.allowsMultipleSelection = true
            cell.cursus = EventManager.sharedInstance.listOfCursus[indexPath.row]
            cell.name.text = cell.cursus.rawValue
        } else {
            tableView.allowsMultipleSelection = false
            cell.ynovReason = EventManager.sharedInstance.listOfYnovReason[indexPath.row]
            cell.name.text = cell.ynovReason.rawValue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.state == .Campus {
            EventManager.sharedInstance.campusSelected.append(EventManager.sharedInstance.listOfCampus[indexPath.row])
            print("after adding tab = \(EventManager.sharedInstance.campusSelected)")
            self.displaySelectionForCampus(list: EventManager.sharedInstance.campusSelected)
        } else if state == .Cursus {
            EventManager.sharedInstance.cursusSelected.append(EventManager.sharedInstance.listOfCursus[indexPath.row])
            self.displaySelectionForCursus(list: EventManager.sharedInstance.cursusSelected)
        } else {
            self.locationTF.text = EventManager.sharedInstance.listOfYnovReason[indexPath.row].rawValue
        }
    }
    
    func displaySelectionForCampus(list:[Campus]) {
        self.campusTF.text = ""
        for campus in list {
            if self.campusTF.text != "" {
                self.campusTF.text = self.campusTF.text! + " | " + campus.rawValue
            } else {
                self.campusTF.text = campus.rawValue
            }
        }
    }
    
    func displaySelectionForCursus(list:[Cursus]) {
        self.cursusTF.text = ""
        for cursus in list {
            if self.cursusTF.text != "" {
                self.cursusTF.text = self.cursusTF.text! + " | " + cursus.rawValue
            } else {
                self.cursusTF.text = cursus.rawValue
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath) as! CampusCell
        // currentCell.contentView.backgroundColor = UIColor.clear
        if self.state == .Campus {
            if let index = EventManager.sharedInstance.campusSelected.index(of: currentCell.campus) {
                EventManager.sharedInstance.campusSelected.remove(at: index)
            }
            self.displaySelectionForCampus(list:EventManager.sharedInstance.campusSelected )
            print("after removing tab = \(EventManager.sharedInstance.campusSelected) , indexPath : \(indexPath.row)")
        } else if state == .Cursus {
            if let index = EventManager.sharedInstance.cursusSelected.index(of: currentCell.cursus) {
                EventManager.sharedInstance.cursusSelected.remove(at: index)
                self.displaySelectionForCursus(list:EventManager.sharedInstance.cursusSelected)
            }
        }
    }
    
    
    
    //MARK Date Picker
    
    func initializeDatePicker() {
        self.datePicker = UIDatePicker(frame: self.tableFrame.frame)
        self.datePicker.datePickerMode = .date
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.ynovGreen
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneDatePicker(sender:)))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker(sender:)))
        
        toolBar.setItems([cancelButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.dateTF.inputView = self.datePicker
        self.dateTF.inputAccessoryView = toolBar
    }
    
    
    
    func doneDatePicker(sender : UIBarButtonItem) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let strDate = dateFormatter.string(from: self.datePicker.date)
        self.dateTF.text = strDate
    }
    
    func cancelDatePicker(sender : UIBarButtonItem) {
        self.dateTF.resignFirstResponder()
    }
    
    //Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.tableFrame.isUserInteractionEnabled = true
        if textField == campusTF {
            self.state = .Campus
            EventManager.sharedInstance.campusSelected.removeAll()
            self.campusTF.text = ""
            self.tableView.reloadData()
        } else if textField == cursusTF {
            self.state = .Cursus
            EventManager.sharedInstance.cursusSelected.removeAll()
            self.cursusTF.text = ""
            self.tableView.reloadData()
        } else if textField == self.locationTF {
            self.locationTF.text = ""
            self.switchYnov.setOn(false, animated: true)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.tableFrame.isUserInteractionEnabled = false
    }
    
    
    
    func showView(v:UIView) {
        v.isHidden = false
        v.isUserInteractionEnabled = true
    }
    func hideView(v:UIView) {
        v.isHidden = true
        v.isUserInteractionEnabled = false
    }
    
    //MARK: ModifyEvent
    
    func handleModifying(event:Event) {
        self.updateUIForModify()
        self.fillWithExisting(event: event)
    }
    
    func updateUIForModify() {
        self.validateEventBt.setTitle("Modifier", for: .normal)
        self.title = "Modifier un évenement"
    }
    
    func fillWithExisting(event:Event) {
        self.reasonTF.text = event.reason
        self.locationTF.text = event.location
        self.dateTF.text = Date.toString(date:event.beginningDate)
        self.duration.text = event.duration.rawValue
        self.displaySelectionForCampus(list: event.campus)
        self.displaySelectionForCursus(list: event.cursus)
        EventManager.sharedInstance.campusSelected = event.campus
        EventManager.sharedInstance.cursusSelected = event.cursus
    }
    
    
}
//MARK Array
extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}

//MARK Duration Picker

extension AddEventController:UIPickerViewDataSource,UIPickerViewDelegate  {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return EventManager.sharedInstance.listOfDuration.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return EventManager.sharedInstance.listOfDuration[row].rawValue
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.duration.text = EventManager.sharedInstance.listOfDuration[row].rawValue
    }
    
    func initializeDurationPicker() {
        self.durationPicker = UIPickerView(frame: self.tableFrame.frame)
        self.durationPicker.delegate = self
        self.durationPicker.dataSource = self
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.ynovGreen
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneDurationPicker(sender:)))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDurationPicker(sender:)))
        
        toolBar.setItems([cancelButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.duration.inputView = self.durationPicker
        self.duration.inputAccessoryView = toolBar
        
    }
    func doneDurationPicker(sender : UIBarButtonItem) {
        let d = self.durationPicker.selectedRow(inComponent: 0)
        EventManager.sharedInstance.durationSelected = EventManager.sharedInstance.listOfDuration[d]
        self.duration.resignFirstResponder()
    }
    
    func cancelDurationPicker(sender : UIBarButtonItem) {
        self.duration.text = ""
        self.duration.resignFirstResponder()
    }
}

extension String {
     func toDate() -> Date {
        //formatting date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        if let d = dateFormatter.date(from: self) {
            return d
        }
        return Date()
    }
  


}


