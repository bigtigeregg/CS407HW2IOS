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
    func addEvent(name:String, desc:String){
        events.append(event(name: name, desc: desc))
    }
}
