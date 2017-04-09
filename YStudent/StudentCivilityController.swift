//
//  StudentCivilityController.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 15/03/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import ToastSwiftFramework
class StudentCivilityController: UIViewController ,UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var cityTf: UITextField!
    @IBOutlet weak var postalCode: UITextField!
    @IBOutlet weak var pickerFrame: UIView!
    @IBOutlet weak var firstNameTf: UITextField!
    @IBOutlet weak var lastNameTf: UITextField!
    @IBOutlet weak var mailTf: UITextField!
    @IBOutlet weak var birthdateTf: UITextField!
    @IBOutlet weak var postalAdressTf: UITextField!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var nextStepButton: UIButton!
    @IBOutlet weak var picture: UIImageView!
    var imagePicker = UIImagePickerController()
    var datePicker = UIDatePicker()
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.ynovPink
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName:UIFont(name:"HelveticaNeue-Light",size:30) as Any]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.sharedManager().enable = true
        self.initialize()
        self.initializeDatePicker()
    }
    
    func initialize() {
        self.firstNameTf.layer.borderColor = UIColor.flatGray.cgColor
        self.firstNameTf.layer.borderWidth = 1.0
        self.firstNameTf.layer.cornerRadius = 4.0
        
        self.lastNameTf.layer.borderColor = UIColor.flatGray.cgColor
        self.lastNameTf.layer.borderWidth = 1.0
        self.lastNameTf.layer.cornerRadius = 4.0
        
        self.mailTf.layer.borderColor = UIColor.flatGray.cgColor
        self.mailTf.layer.borderWidth = 1.0
        self.mailTf.layer.cornerRadius = 4.0
        
        self.birthdateTf.layer.borderColor = UIColor.flatGray.cgColor
        self.birthdateTf.layer.borderWidth = 1.0
        self.birthdateTf.layer.cornerRadius = 4.0
        
        self.postalAdressTf.layer.borderColor = UIColor.flatGray.cgColor
        self.postalAdressTf.layer.borderWidth = 1.0
        self.postalAdressTf.layer.cornerRadius = 4.0
        
        self.postalCode.layer.borderColor = UIColor.flatGray.cgColor
        self.postalCode.layer.borderWidth = 1.0
        self.postalCode.layer.cornerRadius = 4.0
        
        self.cityTf.layer.borderColor = UIColor.flatGray.cgColor
        self.cityTf.layer.borderWidth = 1.0
        self.cityTf.layer.cornerRadius = 4.0
        
        self.phoneTf.layer.borderColor = UIColor.flatGray.cgColor
        self.phoneTf.layer.borderWidth = 1.0
        self.phoneTf.layer.cornerRadius = 4.0
        
        self.nextStepButton.layer.backgroundColor = UIColor.ynovPink.cgColor
        self.nextStepButton.layer.borderColor = UIColor.ynovPink.cgColor
        self.nextStepButton.tintColor = UIColor.flatWhite
        self.nextStepButton.layer.borderWidth = 1.5
        self.nextStepButton.layer.cornerRadius = 4.0
        
        self.view.bringSubview(toFront: self.nextStepButton)
        
        // tap gesture picture
        //add tap reco
        let tapPicture = UITapGestureRecognizer(target: self, action: #selector(handleTapPicture(sender:)))
        tapPicture.delegate = self
        self.picture.addGestureRecognizer(tapPicture)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker =  UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
        }
        
        
    }
    
    func handleTapPicture(sender: UITapGestureRecognizer? = nil) {
        //camera
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            self.view.makeToast("Caméra non disponible", duration: 1.0, position: .bottom)
        }
        
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]){
        imagePicker.dismiss(animated: true, completion: nil)
        self.picture.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    // TO DO externalise to ViewControllerWithLongTap ??
    //MARK Date Picker
    
    func initializeDatePicker() {
        self.datePicker = UIDatePicker(frame: self.pickerFrame.frame)
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
        
        self.birthdateTf.inputView = self.datePicker
        self.birthdateTf.inputAccessoryView = toolBar
    }
    
    
    
    func doneDatePicker(sender : UIBarButtonItem) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let strDate = dateFormatter.string(from: self.datePicker.date)
        self.birthdateTf.text = strDate
    }
    
    func cancelDatePicker(sender : UIBarButtonItem) {
        self.birthdateTf.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.pickerFrame.isUserInteractionEnabled = false
    }
    
    
    
    @IBAction func nextStepTapped(_ sender: Any) {
        if self.firstNameTf.text == "" || self.lastNameTf.text == "" || self.mailTf.text == "" || self.birthdateTf.text == "" || self.postalAdressTf.text == "" || self.phoneTf.text == "" {
            self.view.makeToast("Veuillez remplir tous les champs", duration: 2.0, position: .bottom)
            return
        }
        
        // check TextField
        guard let fn = self.firstNameTf.text else {return}
        guard let ln = self.lastNameTf.text else {return}
        guard let mail = self.mailTf.text else {return}
        guard let phone = Int(self.phoneTf.text!) else {return}
        guard let date = self.birthdateTf.text?.toDate() else {return}
        
        //création User
        let user = Student()
        user.firstName = fn
        user.lastName = ln
        user.birthdate = date
        user.mail = mail
        user.phone = phone
        
        // store in manager
        StudentManager.sharedInstance.creatingStudent = user
        
        // store in realm 
        //RealmManager.sharedInstance.store(s:user)
    
        
    }
}
