//
//  QuoteServiceDelegate.swift
//  Quote Master
//
//  Created by Graham Watson on 13/08/2018.
//  Copyright © 2018 Graham Watson. All rights reserved.
//
//----------------------------------------------------------------------------
// online downloaded results
//----------------------------------------------------------------------------

import Foundation

struct Alias: Codable {
    var id:    Int
    var name:  String
    var added: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case added
    }

    func getId() -> Int {
        return self.id
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getAddedWhen() -> String {
        return self.added
    }
}

struct Quote: Codable {
    var id:    Int
    var text:  String
    var used:  Int
    var added: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case text
        case used
        case added
    }

    func getId() -> Int {
        return self.id
    }
    
    func getText() -> String {
        return self.text
    }
    
    func getTimesUsed() -> Int {
        return self.used
    }
    
    func getAddedWhen() -> String {
        return self.added
    }
}

struct Author: Codable {
    var id:      Int
    var name:    String
    var period:  String
    var added:   String
    var aliases: [Alias]
    var quotes:  [Quote]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case period
        case added
        case aliases
        case quotes
    }
    
    func getId() -> Int {
        return self.id
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getTimePeriod() -> String {
        return self.period
    }
    
    func getAddedWhen() -> String {
        return self.added
    }
    
    func getAliases() -> [Alias] {
        return self.aliases
    }

    func getQuotes() -> [Quote] {
        return self.quotes
    }
}

struct QuoteService: Codable {
    var version:   String
    var service:   String
    var generated: String
    var authors:   [Author]
    
    enum CodingKeys: String, CodingKey {
        case version
        case service
        case generated
        case authors
    }
    
    func getVersion() -> String {
        return self.version
    }
    
    func getService() -> String {
        return self.service
    }
    
    func getGenerated() -> String {
        return self.generated
    }
    
    func getAuthors() -> [Author] {
        return self.authors
    }
}

protocol QuoteServiceDelegate: class {
    var quotes: QuoteService! { get set }
}

class QuoteDelegateHandler: NSObject, QuoteServiceDelegate {
    internal var quotes:  QuoteService!
    internal var useable: Bool = false
    
    init(data: Data!) {
        super.init()
        do {
            let decoder     = JSONDecoder()
            try self.quotes = decoder.decode(QuoteService.self, from: data)
            self.useable    = true
        } catch _ as NSError {
            self.quotes  = nil
            self.useable = false
        }
        return
    }

    func getVersionString() -> String {
        guard self.useable == true || self.quotes != nil else {
            return ""
        }
        return quotes.getVersion()
    }
    
    func getServiceName() -> String {
        guard self.useable == true || self.quotes != nil else {
            return ""
        }
        return quotes.getService()
    }

    func getGeneratedDate() -> String {
        guard self.useable == true || self.quotes != nil else {
            return ""
        }
        return quotes.getGenerated()
    }
    
    func getAuthorCount() -> Int {
        guard self.useable == false || self.quotes != nil else {
            return 0
        }
        return quotes.authors.count
    }
    
    func getAuthors() -> [Author] {
        guard self.useable == false || self.quotes != nil else {
            return nil!
        }
        return self.quotes.authors
    }
}
