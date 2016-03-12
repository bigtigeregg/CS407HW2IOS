//
//  MonthDateTap.swift
//  IOSHW2
//
//  Created by wuyue on 3/4/16.
//  Copyright © 2016 wuyue. All rights reserved.
//

import Foundation
import UIKit


class MonthDateTap: UITapGestureRecognizer{
    var DateComponent : NSDateComponents?
    var indexTap:Int?
    func getText()->String{
        var result:String
        let year = String(DateComponent?.year)
        let month = String(DateComponent?.month)
        let day = String(DateComponent?.day)
        result = year + month + day
        return result
    }
}
