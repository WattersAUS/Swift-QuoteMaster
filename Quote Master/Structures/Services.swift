//
//  Services
//  Quote Master
//
//  Created by Graham Watson on 09/09/2018.
//  Copyright © 2018 Graham Watson. All rights reserved.
//

import Foundation

// new token service

struct NewTokenService: Codable {
    var version:   String
    var service:   String
    var generated: String
    var token:     String
    
    private enum CodingKeys: String, CodingKey {
        case version
        case service
        case generated
        case token
    }
}

// quote service

struct Alias: Codable {
    var id:    Int
    var name:  String
    var added: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case added
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
}

struct Author: Codable {
    var id:      Int
    var name:    String
    var period:  String
    var aliases: [Alias]
    var quotes:  [Quote]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case period
        case aliases
        case quotes
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
}
