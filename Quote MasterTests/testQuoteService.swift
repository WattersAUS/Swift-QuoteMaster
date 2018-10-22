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
                "period": "Perd1",
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
                        "used": 5,
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
                "period": "Perd2",
                "added": "2017-11-10 16:23:29",
                "aliases": [],
                "quotes": [
                    {
                        "id": 274,
                        "text": "The return we reap from generous actions is not always evident.",
                        "used": 1,
                        "added": "2017-11-23 15:23:29"
                    },
                    {
                        "id": 2469,
                        "text": "Since there is nothing so well worth having as friends, never lose a chance to make them.",
                        "used": 10,
                        "added": "2018-07-06 09:31:43"
                    }
                ]
            }
        ]
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
        self.testClass = QuoteDelegateHandler(data: self.jsonData)
        
        // first up were we able to parse the JSON
        XCTAssertEqual(self.testClass.useable, true, "Failed to parse JSON fragment!")
        
        // "version": "v1.08"
        // "service": "GetAllAuthorsWithQuotes"
        // "generated": "2018-10-03 21:12:37"
        
        XCTAssertEqual(self.testClass.getVersionString(), "v1.08",                   "Unable to retrieve correct version!")
        XCTAssertEqual(self.testClass.getServiceName(),   "GetAllAuthorsWithQuotes", "Incorrect service name returned!")
        XCTAssertEqual(self.testClass.getGeneratedDate(), "2018-10-03 21:12:37",     "Incorrect service generated date returned!")
        XCTAssertEqual(self.testClass.getAuthorCount(),   2,                         "Incorrect number of authors detected!")
        
        // authors
        let authors: [Author] = self.testClass.getAuthors()
        XCTAssertEqual(authors.count, self.testClass.getAuthorCount(), "Incorrect number of authors detected!")
        
        // author 1
        
        // "id": 172
        // "name": "James A. Baldwin"
        // "period": "Perd1"
        // "added": "2017-10-10 15:23:29"
        
        var author: Author = authors[0]
        XCTAssertEqual(author.getId(),         172,                   "Author 0: Incorrect author id returned!")
        XCTAssertEqual(author.getName(),       "James A. Baldwin",    "Author 0: Incorrect author name returned!")
        XCTAssertEqual(author.getTimePeriod(), "Perd1",               "Author 0: Incorrect time period returned!")
        XCTAssertEqual(author.getAddedWhen(),  "2017-10-10 15:23:29", "Author 0: Incorrect added date returned!")
        
        // aliases
        var aliases: [Alias] = author.getAliases()
        XCTAssertEqual(aliases.count, 1, "Incorrect number of authors detected!")
        
        // alias 1
        
        // "id": 7
        // "name": "James Baldwin"
        // "added": "2018-07-28 13:18:17"

        XCTAssertEqual(aliases[0].getId(),        7,                     "Alias 0: Incorrect alias id returned!")
        XCTAssertEqual(aliases[0].getName(),      "James Baldwin",       "Alias 0: Incorrect alias name returned!")
        XCTAssertEqual(aliases[0].getAddedWhen(), "2018-07-28 13:18:17", "Alias 0: Incorrect added date returned!")

        // quotes
        var quotes: [Quote] = author.getQuotes()
        XCTAssertEqual(quotes.count, 2, "Incorrect number of quotes detected!")

        // quote 1
        
        // "id": 273,
        // "text": "People are trapped in history and history is trapped in them.",
        // "used": 1,
        // "added": "2017-10-10 15:23:29"

        var quote: Quote  = quotes[0]
        XCTAssertEqual(quote.getId(),        273,                                                             "Quote 0: Incorrect quote id returned!")
        XCTAssertEqual(quote.getText(),      "People are trapped in history and history is trapped in them.", "Quote 0: Incorrect quote text returned!")
        XCTAssertEqual(quote.getTimesUsed(), 5,                                                               "Quote 0: Incorrect times used returned!")
        XCTAssertEqual(quote.getAddedWhen(), "2017-10-10 15:23:29",                                           "Quote 0: Incorrect added date returned!")

        // quote 2
        
        // "id": 2530,
        // "text": "Not everything that is faced can be changed, but nothing can be changed until it is faced.",
        // "used": 0,
        // "added": "2018-07-16 08:10:59"

        quote = quotes[1]
        XCTAssertEqual(quote.getId(),         2530,                                                                                        "Quote 1: Incorrect quote id returned!")
        XCTAssertEqual(quote.getText(),      "Not everything that is faced can be changed, but nothing can be changed until it is faced.", "Quote 1: Incorrect quote text returned!")
        XCTAssertEqual(quote.getTimesUsed(), 0,                                                                                            "Quote 1: Incorrect times used returned!")
        XCTAssertEqual(quote.getAddedWhen(), "2018-07-16 08:10:59",                                                                        "Quote 1: Incorrect added date returned!")

        // author 2

        // "id": 173,
        // "name": "Francesco Guicciardini",
        // "period": "Perd2",
        // "added": "2017-11-10 16:23:29",
        
        author = authors[1]
        XCTAssertEqual(author.getId(),         173,                      "Author 1: Incorrect author id returned!")
        XCTAssertEqual(author.getName(),       "Francesco Guicciardini", "Author 1: Incorrect author name returned!")
        XCTAssertEqual(author.getTimePeriod(), "Perd2",                  "Author 1: Incorrect time period returned!")
        XCTAssertEqual(author.getAddedWhen(),  "2017-11-10 16:23:29",    "Author 1: Incorrect generated date returned!")

        // aliases
        aliases = author.getAliases()
        XCTAssertEqual(aliases.count, 0, "Incorrect number of authors detected!")

        // quotes
        quotes = author.getQuotes()
        XCTAssertEqual(quotes.count, 2, "Incorrect number of quotes detected!")
        
        // quote 1
        
        // "id": 274,
        // "text": "The return we reap from generous actions is not always evident.",
        // "used": 1,
        // "added": "2017-11-23 15:23:29"

        quote = quotes[0]
        XCTAssertEqual(quote.getId(),         274,                                                              "Quote 0: Incorrect quote id returned!")
        XCTAssertEqual(quote.getText(),      "The return we reap from generous actions is not always evident.", "Quote 0: Incorrect quote text returned!")
        XCTAssertEqual(quote.getTimesUsed(), 1,                                                                 "Quote 0: Incorrect times used returned!")
        XCTAssertEqual(quote.getAddedWhen(), "2017-11-23 15:23:29",                                             "Quote 0: Incorrect added date returned!")
        
        // quote 2

        // "id": 2469,
        // "text": "Since there is nothing so well worth having as friends, never lose a chance to make them.",
        // "used": 10,
        // "added": "2018-07-06 09:31:43"

        quote = quotes[1]
        XCTAssertEqual(quote.getId(),         2469,                                                                                       "Quote 1: Incorrect quote id returned!")
        XCTAssertEqual(quote.getText(),      "Since there is nothing so well worth having as friends, never lose a chance to make them.", "Quote 1: Incorrect quote text returned!")
        XCTAssertEqual(quote.getTimesUsed(), 10,                                                                                          "Quote 1: Incorrect times used returned!")
        XCTAssertEqual(quote.getAddedWhen(), "2018-07-06 09:31:43",                                                                       "Quote 1: Incorrect added date returned!")
        
        self.testClass = nil
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
