//
//  DateCell.swift
//  IOSHW2
//
//  Created by wuyue on 3/5/16.
//  Copyright © 2016 wuyue. All rights reserved.
//

import Foundation
import UIKit


class DateCell: UITableViewCell{
    @IBOutlet weak var Titile: UILabel!
    @IBOutlet weak var Desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(calander: Calander){
        Titile.text = calander.title
        Desc.text = calander.desc
    }
}
