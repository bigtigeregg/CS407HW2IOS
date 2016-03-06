//
//  AddEventViewController.swift
//  IOSHW2
//
//  Created by wuyue on 3/5/16.
//  Copyright © 2016 wuyue. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController, UITextFieldDelegate{
    
    var selectDate:NSDateComponents!
    @IBOutlet weak var EventNameTextField: UITextField!
    @IBOutlet weak var EventDescriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //Events
    @IBAction func btnAddEvent_Click(sender:UIButton){
        print("Button")
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true
    }
}