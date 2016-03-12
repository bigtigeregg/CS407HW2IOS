//
//  EventManager.swift
//  IOSHW2
//
//  Created by wuyue on 3/5/16.
//  Copyright © 2016 wuyue. All rights reserved.
//
import UIKit
import Foundation

import CoreData

var eventMgr: EventManager = EventManager()

// structure Event
struct event{
    var name = "Un_Named"
    var desc = "Un-Described"
}

class EventManager:NSObject{
    var events = [event]()
    var myEventDicts:[String: [event]] = [String: [event]]()
//    
//    func addEvent(Date:String, name:String, desc:String){
//        if myEventDicts.keys.contains(Date){
//            var curEvent1 = [event]()
//            curEvent1 = myEventDicts[Date]!
//            curEvent1.append(event(name: name, desc: desc))
//            myEventDicts[Date] = curEvent1
//        }else{
//            var curEvent2 = [event]()
//            curEvent2.append(event(name: name, desc: desc))
//            myEventDicts[Date] = curEvent2
//        }
//    }
    
    
    func EventCoreData(Date:String, name:String, desc: String){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("Calander", inManagedObjectContext:managedContext)
        let eventEntity = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        entity!.setValue(Date, forKey:"date")
        entity!.setValue(name, forKey:"title")
        entity!.setValue(desc, forKey:"name")
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
//    func getText(Date:MonthDateTap)->String{
//        var result:String
//        let year = String(Date.DateComponent?.year)
//        let month = String(Date.DateComponent?.month)
//        let day = String(Date.DateComponent?.day)
//        result = year + month + day
//        return result
//    }
//    func deleteEvent(Date:String, index: Int){
//        if myEventDicts.keys.contains(Date){
//            var curEvent1 = [event]()
//            curEvent1 = myEventDicts[Date]!
//            curEvent1.removeAtIndex(index);
//            myEventDicts[Date] = curEvent1
//        }
//    }
}
