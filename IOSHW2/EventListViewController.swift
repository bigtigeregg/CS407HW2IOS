//
//  EventListViewController.swift
//  IOSHW2
//
//  Created by wuyue on 3/5/16.
//  Copyright © 2016 wuyue. All rights reserved.
//

import UIKit
import CoreData

class EventListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
 
    var selectDate:MonthDateTap!
    var Calanders = [Calander]()
    var curEvent1 = [event]()
    
//    
//    var fetchedResultsController: NSFetchedResultsController!
//    
//    
    @IBOutlet var tblEvents: UITableView!
    
    
    func fetchAndSetResult(){
        // get the main the delegate
        Calanders.removeAll()
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Calander")
        do{
            let results = try context.executeFetchRequest(fetchRequest)
            self.Calanders = results as! [Calander]
            for eachDate in Calanders {
                if eachDate.date == selectDate.getText() {
                    var tempEvent = event()
                    tempEvent.name = eachDate.title!
                    tempEvent.desc = eachDate.desc!
                    curEvent1.append(tempEvent)
                }
            }
            
        }catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        fetchAndSetResult()
        tblEvents.delegate = self
        tblEvents.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        curEvent1.removeAll()
        fetchAndSetResult()
        tblEvents.reloadData()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        // need to change here
//        if(eventMgr.myEventDicts[selectDate.getText()]==nil){
//            return 0
//        }else{
//            return eventMgr.myEventDicts[selectDate.getText()]!.count
//        }
        
        return curEvent1.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
       
        
        cell.textLabel?.text = curEvent1[indexPath.row].name
       // cell.detailTextLabel?.text = eventMgr.myEventDicts[selectDate.getText()]![indexPath.row].desc
        cell.detailTextLabel?.text = curEvent1[indexPath.row].desc
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            print("Delete")
            print("Select row %d", indexPath.row)
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let fetchRequest = NSFetchRequest(entityName: "Calander")
            var i = 0
            for eachDate in Calanders {
                if eachDate.date == selectDate.getText() {
                    if(i == indexPath.row){
                        context.deleteObject(Calanders[indexPath.row] as NSManagedObject)
                        Calanders.removeAtIndex(indexPath.row)
                        do{
                            try context.save()
                        }catch{
                            print("could not save calander")
                        }
                    }
                    i++
                }
            }
            curEvent1.removeAll()
            fetchAndSetResult()
            tblEvents.reloadData()
        }
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
