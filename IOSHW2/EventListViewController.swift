//
//  EventListViewController.swift
//  IOSHW2
//
//  Created by wuyue on 3/5/16.
//  Copyright © 2016 wuyue. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        // need to change here
        return 3
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
//        cell.textLabel?.text = eventMgr.events[indexPath.row].name
//        cell.detailTextLabel?.text = eventMgr.events[indexPath.row].desc
        return cell
    }
    
}
