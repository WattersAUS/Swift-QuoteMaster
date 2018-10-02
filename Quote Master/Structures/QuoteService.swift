//
//  QuoteService.swift
//  Quote Master
//
//  Created by Graham Watson on 09/09/2018.
//  Copyright © 2018 Graham Watson. All rights reserved.
//

import Foundation

struct QuoteService {
    var version:   String
    var service:   String
    var generated: String
    var authors:  [Author]
    
    init() {
        version   = ""
        service   = ""
        generated = ""
        authors = []
        return
    }
    
    mutating func clearAuthors() {
        authors = []
        return
    }
    
    mutating func addAuthor(newauthor: Author) {
        authors.append(newauthor)
        return
    }
    
    mutating func addAuthors(newauthors: [Author]) {
        authors.append(contentsOf: newauthors)
        return
    }
}
