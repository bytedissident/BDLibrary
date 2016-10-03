//
//  BDCoreDataStack.swift
//  Run
//
//  Created by derek lee bronston on 9/30/16.
//  Copyright © 2016 Bytedissident. All rights reserved.
//

import UIKit
import CoreData

class BDCoreDataStack{

    //SET MODEL NAME: Changed from default
    var modelName:String!
    
    init(modelName:String) {
        self.modelName = modelName
    }
    
    lazy var applicationDocumentsDirectory: NSURL = {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return url[url.count - 1] as NSURL
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd")
         return NSManagedObjectModel(contentsOf: modelURL!)!
    }()
    
    lazy var psCoordinator: NSPersistentStoreCoordinator = {
        
        let coordinator = NSPersistentStoreCoordinator(
            managedObjectModel: self.managedObjectModel)
        
        let url = self.applicationDocumentsDirectory.appendingPathComponent("\(self.modelName).sqlite")
        
        do {
            try coordinator.addPersistentStore(
                ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            let nserror = error as NSError
            print("Error: \(nserror.localizedDescription)")
        }
        
        return coordinator
    }()
    
    lazy var context: NSManagedObjectContext = {
        var managedObjectContext = NSManagedObjectContext(
            concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = self.psCoordinator
        return managedObjectContext
    }()
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Error: \(nserror.localizedDescription)")
                //abort()
            }
        }
    }
}
