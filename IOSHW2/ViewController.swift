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
        for i in 7...41{
            let eachView = view.viewWithTag(i)!
            let eachTap = MonthDateTap()
            eachTap.addTarget(self, action: "segue:")
            eachView.addGestureRecognizer(eachTap)
            eachView.userInteractionEnabled = true
        }
        print("hello")
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
    
    func segue(sender : UIGestureRecognizer) {
        btnSound.play()
        print(sender.view?.tag)
    }
}

