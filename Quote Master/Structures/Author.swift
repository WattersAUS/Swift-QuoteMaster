//
//  Author.swift
//  Quote Master
//
//  Created by Graham Watson on 09/09/2018.
//  Copyright © 2018 Graham Watson. All rights reserved.
//

import Foundation

struct Author {
    var id:     Int
    var name:   String
    var quotes: [Quote]
    
    init() {
        id     = -1
        name   = ""
        quotes = []
        return
    }
    
    init(newid: Int, newname: String) {
        id     = newid
        name   = newname
        quotes = []
        return
    }
    
    mutating func clearQuotes() {
        quotes = []
        return
    }
    
    mutating func addQuote(newquote: Quote) {
        quotes.append(newquote)
        return
    }
    
    mutating func addQuotes(newquotes: [Quote]) {
        quotes.append(contentsOf: newquotes)
        return
    }
}
