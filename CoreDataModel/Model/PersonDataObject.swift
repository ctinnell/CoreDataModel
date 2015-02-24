//
//  File.swift
//  CoreDataModel
//
//  Created by Clay Tinnell on 2/24/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//

import Foundation
import CoreData

extension Person {
    
    class func entityName() -> String {
        return "Person"
    }
    
    class func loadTestData(moc: NSManagedObjectContext) {
        let fetchRequest = NSFetchRequest(entityName: entityName())
        let entityDescription = NSEntityDescription.entityForName(entityName(), inManagedObjectContext: moc)
        fetchRequest.entity = entityDescription
        var fetchError: NSError?
        let results = moc.executeFetchRequest(fetchRequest, error: &fetchError) as [Person]
        if let error = fetchError {
            println("Error with Fetch Request: \(error.description)")
        }
        else if countElements(results) == 0 {
            createPerson("Bill Gates", email: "billgates@microsoft.com", moc: moc)
            createPerson("Tim Cook", email: "timcook@apple.com", moc: moc)
        }
    }
    
    class func createPerson(name: String, email: String, moc: NSManagedObjectContext) {
        let person = NSEntityDescription.insertNewObjectForEntityForName(entityName(), inManagedObjectContext: moc) as Person
        var saveError: NSError?
        person.name = name
        person.email = email
        moc.save(&saveError)
        if let error = saveError {
            println("Error with managed object context: \(error)")
        }
    }
}