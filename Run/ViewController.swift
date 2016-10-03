//
//  ViewController.swift
//  Run
//
//  Created by derek lee bronston on 9/30/16.
//  Copyright © 2016 Bytedissident. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stack = BDCoreDataStack(modelName: "Run")
        let context = stack.context
        
        //let entity = NSEntityDescription.entity(forEntityName: "Test", in: context)
        //let test = NSManagedObject(entity: entity!, insertInto: context)
       
        //let test = test
        let req:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Test");
        var res = [AnyObject]();
        do {
        
            res =  try context.fetch(req)
            print(res[0].value(forKey: "att"))
        }catch{
            print("error ")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

