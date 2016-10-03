//
//  BDDataManager.swift
//  Run
//
//  Created by derek lee bronston on 9/30/16.
//  Copyright © 2016 Bytedissident. All rights reserved.
//

import UIKit
import CoreData


class BDDataManager {
    
    var modelName:String!
    var stack:BDCoreDataStack!
    
    init(modelName:String){
        self.modelName = modelName
        self.stack = BDCoreDataStack(modelName: modelName)
    }
    
    
    func add(entity:String,object:AnyObject,key:String,complete:@escaping ()->Void,fail:@escaping()->Void){
    
        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateContext.persistentStoreCoordinator = self.stack.psCoordinator
        
        let e = NSEntityDescription.entity(forEntityName: entity, in: privateContext)
        if e != nil {
            let m = NSManagedObject(entity: e!, insertInto: privateContext)
            privateContext.perform({ 
                m.setValue(object, forKey: key)
                do {
                    try privateContext.save()
                    DispatchQueue.main.async {
                        complete()
                    }
                }catch{
                    DispatchQueue.main.async {
                        fail()
                    }
                }
            } )
        }else{
            fail()
        }
    }
}
