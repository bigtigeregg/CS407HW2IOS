//
//  Calander+CoreDataProperties.swift
//  IOSHW2
//
//  Created by wuyue on 3/11/16.
//  Copyright © 2016 wuyue. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Calander {

    @NSManaged var date: String?
    @NSManaged var desc: String?
    @NSManaged var title: String?

}
