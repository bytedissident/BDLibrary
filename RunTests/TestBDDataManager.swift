//
//  TestBDDataManager.swift
//  Run
//
//  Created by derek lee bronston on 10/3/16.
//  Copyright © 2016 Bytedissident. All rights reserved.
//

import XCTest
@testable import Run

class TestBDDataManager: XCTestCase {
    
    let sut = BDDataManager(modelName: "Run")
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAdd(){
        
        //INTENTIOANL FAIL HANDLE ERROR
        sut.add(entity: "none", object: "" as AnyObject, key: "", complete: {
                XCTFail("SHOLD NOT HAVE HIT COMPLETE")
            }) { 
                XCTAssertTrue(true)
        }
        
        sut.add(entity: "Test", object: "test" as AnyObject, key: "att", complete: {
             XCTAssertTrue(true)
        }) {
             XCTFail("SHOuLD HAVE HIT COMPLETE")
        }
        
    }
    
}
