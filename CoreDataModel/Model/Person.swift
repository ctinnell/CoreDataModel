//
//  Person.swift
//  CoreDataModel
//
//  Created by Clay Tinnell on 2/24/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//

import Foundation
import CoreData

class Person: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var email: String

}
