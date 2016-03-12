//
//  AddEventViewController.swift
//  IOSHW2
//
//  Created by wuyue on 3/5/16.
//  Copyright © 2016 wuyue. All rights reserved.
//

import UIKit
import CoreData

class AddEventViewController: UIViewController, UITextFieldDelegate{
    
    var selectDate:MonthDateTap!
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
        
        if let title = EventNameTextField.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Calander", inManagedObjectContext: context)!
            let calander = Calander(entity: entity, insertIntoManagedObjectContext: context)

            calander.date = selectDate.getText()
            calander.desc = EventDescriptionTextField.text!
            calander.title = EventNameTextField.text!
            
            context.insertObject(calander)
            do{
                try context.save()
            }catch{
                print("could not save calander")
            }
//            eventMgr.addEvent(selectDate.getText(), name: EventNameTextField.text!, desc: EventDescriptionTextField.text!)
            
            
        }
        
        self.view.endEditing(true)
        EventNameTextField.text = ""
        EventDescriptionTextField.text = ""
        self.navigationController?.popViewControllerAnimated(true)
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