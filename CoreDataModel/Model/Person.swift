//
//  Person.swift
//  CoreDataModel
//
//  Created by Clay Tinnell on 2/24/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//

import Foundation
import CoreData

@objc(Person)
public class Person: NSManagedObject {

    @NSManaged public var name: String
    @NSManaged public var email: String

}
