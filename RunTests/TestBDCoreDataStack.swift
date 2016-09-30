//
//  TestBDCoreDataStack.swift
//  Run
//
//  Created by derek lee bronston on 9/30/16.
//  Copyright © 2016 Bytedissident. All rights reserved.
//

import XCTest
@testable import Run

class TestBDCoreDataStack: XCTestCase {
    
    let sut = BDCoreDataStack(modelName: "Run")
    override func setUp() {
        super.setUp()
        //self.sut = BDCoreDataStack(modelName:"Run")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testApplicationDocumentsDirectory(){
        
      let dir = self.sut.applicationDocumentsDirectory
      XCTAssertNotNil(dir,"problem with app directory")
    }
    
    func testManagedObjectModel(){
        
        let mo = self.sut.managedObjectModel
        XCTAssertNotNil(mo,"problem with mom")
    }
    
    func testPsCoordinator(){
        
        let psc = self.sut.psCoordinator
        XCTAssertNotNil(psc,"problem with psc")
    }

}

