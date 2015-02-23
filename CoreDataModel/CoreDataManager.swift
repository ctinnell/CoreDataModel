//
//  CoreDataManager.swift
//  CoreDataModel
//
//  Created by Clay Tinnell on 2/23/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataManager {

    public var managedObjectModel: NSManagedObjectModel?
    public var persistentStoreCoordinator: NSPersistentStoreCoordinator?
    public var managedObjectContext: NSManagedObjectContext?
    
    private let productName = "DataModel"
    private let schemaName = "DataModelSchema"

    init() {
        managedObjectModel = initializeManagedObjectModel()
        persistentStoreCoordinator = initializePersistentStoreCoordinator()
        managedObjectContext = initializeManagedObjectContext()
    }
    
    private func initializeManagedObjectModel() -> NSManagedObjectModel? {
        var model: NSManagedObjectModel?
        if let bundlePath = [NSBundle.mainBundle().pathForResource(schemaName, ofType: "bundle")][0] {
            let bundle = NSBundle(path: bundlePath)
            if let modelPath = bundle?.pathForResource(productName, ofType: "momd") {
                if let modelURL = NSURL.fileURLWithPath(modelPath) {
                    model = NSManagedObjectModel(contentsOfURL: modelURL)
                }
            }
        }
        return model
    }
    
    private func initializePersistentStoreCoordinator() -> NSPersistentStoreCoordinator? {
        let url = NSURL.fileURLWithPath(self.applicationDocumentsDirectory().stringByAppendingPathComponent("\(productName).sqlite"))
        let options = [NSMigratePersistentStoresAutomaticallyOption:1, NSInferMappingModelAutomaticallyOption:1]
        var storeCoordinator: NSPersistentStoreCoordinator?
        
        if let mom = managedObjectModel {
            storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: mom)
        }
        else {
            println("Unable to create Persistent Store!!!")
        }
        
        //encrypt data store
        var error: NSError?
        let fileAttributes = [NSFileProtectionKey:NSFileProtectionComplete]
        if let urlPath = url?.path {
            if(!NSFileManager.defaultManager().setAttributes(fileAttributes, ofItemAtPath: urlPath, error: &error)) {
                if let e = error {
                    println("Unable to encrypt database: \(e): \(e.userInfo)")
                }
            }
            
        }
        
        return storeCoordinator
    }
    
    private func initializeManagedObjectContext() -> NSManagedObjectContext? {
        var objectContext: NSManagedObjectContext?
        objectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        objectContext?.persistentStoreCoordinator = persistentStoreCoordinator
        return objectContext
    }
    
    private func applicationDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as [String]
        return paths[countElements(paths) - 1]
    }
}
