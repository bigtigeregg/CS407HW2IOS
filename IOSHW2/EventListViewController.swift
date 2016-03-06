//
//  EventListViewController.swift
//  IOSHW2
//
//  Created by wuyue on 3/5/16.
//  Copyright © 2016 wuyue. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    var selectDate:NSDateComponents!
    
    @IBOutlet var tblEvents: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        tblEvents.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        // need to change here
        if(eventMgr.myEventDicts[selectDate]==nil){
            return 0
        }else{
            return eventMgr.myEventDicts[selectDate]!.count
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
        cell.textLabel?.text = eventMgr.myEventDicts[selectDate]![indexPath.row].name
        cell.detailTextLabel?.text = eventMgr.myEventDicts[selectDate]![indexPath.row].desc
        return cell
    }
    
    @IBAction func bar_AddButton(sender: UIButton) {
        self.performSegueWithIdentifier("toAddEventViewController", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toAddEventViewController") {
            let eventsList: AddEventViewController = segue.destinationViewController as! AddEventViewController
            eventsList.selectDate = selectDate
        }
    }
    
}
