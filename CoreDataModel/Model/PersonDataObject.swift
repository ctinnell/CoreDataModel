//
//  PersonDataObject.swift
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
    
    public class func loadTestData(managedObjectContext: NSManagedObjectContext?) {
        if let moc = managedObjectContext {
            let (results, fetchError) = allObjects(moc)
            if let error = fetchError {
                println("Error with Fetch Request: \(error.description)")
            }
            else if countElements(results) == 0 {
                createPerson("Bill Gates", email: "billgates@microsoft.com", managedObjectContext: moc)
                createPerson("Tim Cook", email: "timcook@apple.com", managedObjectContext: moc)
            }
            else {
                println("data already loaded")
            }
        }
    }
    
    public class func createPerson(name: String, email: String, managedObjectContext: NSManagedObjectContext?) {
        if let moc = managedObjectContext {
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
    
    public class func allObjects(moc: NSManagedObjectContext) -> ([Person], NSError?) {
        let fetchRequest = NSFetchRequest(entityName: entityName())
        let entityDescription = NSEntityDescription.entityForName(entityName(), inManagedObjectContext: moc)
        fetchRequest.entity = entityDescription
        var fetchError: NSError?
        let results = moc.executeFetchRequest(fetchRequest, error: &fetchError) as [Person]
        return (results, fetchError)
    }
}