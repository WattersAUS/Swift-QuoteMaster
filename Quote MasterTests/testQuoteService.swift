//
//  testQuoteService.swift
//  Quote MasterTests
//
//  Created by Graham Watson on 09/10/2018.
//  Copyright © 2018 Graham Watson. All rights reserved.
//

import XCTest
@testable import Quote_Master

class testQuoteService: XCTestCase {

    var testClass: QuoteDelegateHandler!
    var jsonData = """
    {
        "version": "v1.08",
        "service": "GetAllAuthorsWithQuotes",
        "generated": "2018-10-03 21:12:37",
        "authors": [
            {
                "id": 172,
                "name": "James A. Baldwin",
                "period": "",
                "added": "2017-10-10 15:23:29",
                "aliases": [
                    {
                        "id": 7,
                        "name": "James Baldwin",
                        "added": "2018-07-28 13:18:17"
                    }
                ],
                "quotes": [
                    {
                        "id": 273,
                        "text": "People are trapped in history and history is trapped in them.",
                        "used": 1,
                        "added": "2017-10-10 15:23:29"
                    },
                    {
                        "id": 2530,
                        "text": "Not everything that is faced can be changed, but nothing can be changed until it is faced.",
                        "used": 0,
                        "added": "2018-07-16 08:10:59"
                    }
                ]
            },
            {
                "id": 173,
                "name": "Francesco Guicciardini",
                "period": "",
                "added": "2017-11-10 15:23:29",
                "aliases": [],
                "quotes": [
                    {
                        "id": 274,
                        "text": "The return we reap from generous actions is not always evident.",
                        "used": 1,
                        "added": "2017-11-10 15:23:29"
                    },
                    {
                        "id": 2469,
                        "text": "Since there is nothing so well worth having as friends, never lose a chance to make them.",
                        "used": 0,
                        "added": "2018-07-06 09:31:43"
                    }
                ]
            }
        ]
    }
    """.data(using: .utf8)!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.testClass = QuoteDelegateHandler()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.testClass = nil
    }

    func test_decodeJson() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        self.testClass.loadQuotes(url: <URLGOESHERE>)
        let _ = self.testClass.decodeJSON(data: self.jsonData)
        XCTAssertEqual(self.testClass.useable,  true, "Invalid JSON parsing")
        XCTAssertEqual(self.testClass.quotes.authors.count,  2, "Incorrect number of authors detected!")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
