//
//  ViewController.swift
//  IOSHW2
//
//  Created by wuyue on 3/4/16.
//  Copyright © 2016 wuyue. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // hello
    
    @IBOutlet weak var outputLbl: UILabel!

    var btnSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSBundle.mainBundle().pathForResource("btn",ofType:"wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        let curyear =  Int(components.year)
        let curmonth = Int(components.month)
        let curday = components.day
        
        
        
        for i in 7...41{
            let eachView = view.viewWithTag(i)!
            let eachTap = MonthDateTap()
            eachTap.addTarget(self, action: "segue:")
            eachView.addGestureRecognizer(eachTap)
            eachView.userInteractionEnabled = true
        }
        
        
        let startIndex = 7 + MonthCalculate.getStartIndex(curmonth,year: curyear)
        
        for k in 7...41 {
            let label = view.viewWithTag(k + 100) as! UILabel
            label.text = nil
        }
        
        
        
        let endIndex = startIndex + MonthCalculate.getDaysCount(curmonth, year: curyear)-1
        
        
        for j in startIndex...endIndex
        {
            // get current month and year
            let getlabel = view.viewWithTag(j+100) as! UILabel
            //let label = view.viewWithTag(i + 100 + allDayComponents[0].weekday - 1) as! UILabel
            
            let StringDateNum = String(j - startIndex + 1)
            
            let attributedString = NSMutableAttributedString(string: StringDateNum)
            getlabel.font = UIFont(name: "Minecraft",size: 17)!
            getlabel.attributedText = attributedString
        }
        do{
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        }catch let err as NSError{
            print(err.debugDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func datePressed(myview: UIView!){
        btnSound.play()
    }
    
    func getCurMonthDate(){
        NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle:NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.NoStyle)
    }
    
//    func isToday()->Bool
//    {
////        let today = NSCalendar.currentCalendar().calender.components([NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.Day, NSCalendarUnit.Weekday], fromDate: NSDate())
//    }
    
    func segue(sender : UIGestureRecognizer) {
        btnSound.play()
        print(sender.view?.tag)
    }
}

