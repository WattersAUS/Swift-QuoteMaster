//
//  testTokenService.swift
//  Quote MasterTests
//
//  Created by Graham Watson on 22/10/2018.
//  Copyright © 2018 Graham Watson. All rights reserved.
//

import XCTest
@testable import Quote_Master

class testTokenService: XCTestCase {
    
    var testClass: TokenDelegateHandler!
    
    var jsonData = """
    {
        "version": "v1.00",
        "service": "GetNewAccessToken",
        "generated": "2018-10-02 17:01:57",
        "token": "12345678-1234-4321-1234-123456789012"
    }
    """.data(using: .utf8)!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_decodeJson() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        self.testClass = TokenDelegateHandler(data: self.jsonData)
        
        // first up were we able to parse the JSON
        XCTAssertEqual(self.testClass.useable, true, "Failed to parse JSON fragment!")
        
        XCTAssertEqual(self.testClass.getVersionString(), "v1.00",                                "Unable to retrieve correct version!")
        XCTAssertEqual(self.testClass.getServiceName(),   "GetNewAccessToken",                    "Incorrect service name returned!")
        XCTAssertEqual(self.testClass.getGeneratedDate(), "2018-10-02 17:01:57",                  "Incorrect service generated date returned!")
        XCTAssertEqual(self.testClass.getToken(),         "12345678-1234-4321-1234-123456789012", "Incorrect token returned!")
        
        self.testClass = nil
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
