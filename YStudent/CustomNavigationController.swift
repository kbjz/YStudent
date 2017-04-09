//
//  CustomNavigationController.swift
//  YStudent
//
//  Created by Kevin Bernajuzan on 09/04/2017.
//  Copyright © 2017 Kevin Bernajuzan. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(handleBackToInitial(sender:)), name: NSNotification.Name(rawValue: "backToInitial"), object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func handleBackToInitial(sender : Notification) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "initialVC") {
            self.pushViewController(vc, animated: false)
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
