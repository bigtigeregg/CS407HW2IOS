//
//  EventManager.swift
//  IOSHW2
//
//  Created by wuyue on 3/5/16.
//  Copyright © 2016 wuyue. All rights reserved.
//
import UIKit

var eventMgr: EventManager = EventManager()

// structure Event
struct event{
    var name = "Un_Named"
    var desc = "Un-Described"
}


class EventManager:NSObject{
    var events = [event]()
    var myEventDicts:[NSDateComponents: [event]] = [NSDateComponents: [event]]()
    
    func addEvent(Date:NSDateComponents, name:String, desc:String){
        if myEventDicts.keys.contains(Date){
            var curEvent = [event]()
            curEvent = myEventDicts[Date]!
            curEvent.append(event(name: name, desc: desc))
        }else{
            var curEvent = [event]()
            curEvent.append(event(name: name, desc: desc))
            myEventDicts[Date] = curEvent
        }
    }
}
