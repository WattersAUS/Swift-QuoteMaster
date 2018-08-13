//
//  OnlineServices.swift
//  Quote Master
//
//  Created by Graham Watson on 13/08/2018.
//  Copyright © 2018 Graham Watson. All rights reserved.
//

import Foundation

//
// Tag dictionary for JSON (these will map to the payloads)
//

enum serviceHeader: String {
    case Version = "version"
    case Service = "service"
    case GenDate = "generated"
    case Author  = "author"
    case Authors = "authors"
}

enum serviceType: String {
    case AllQuotes = "GetAllAuthorsWithQuotes"
    case Author    = "GetAuthorWithQuotes"
    case Authors   = "GetAllAuthors"
    case Random    = "GetRandomAuthorWithQuote"
}

enum serviceAuthor: String {
    case Id      = "id"
    case Name    = "name"
    case Period  = "period"
    case Aliases = "aliases"
    case Quote   = "quote"
    case Quotes  = "quotes"
}

enum serviceAlias: String {
    case Id    = "id"
    case name  = "name"
    case Added = "added"
}

enum serviceQuote: String {
    case Id    = "id"
    case Text  = "text"
    case Used  = "used"
    case Added = "added"
}

struct Quote {
    var id:   Int
    var text: String

    init() {
        id   = -1
        text = ""
        return
    }
    
    init(newid: Int, newtext: String) {
        id   = newid
        text = newtext
    }
}

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
    }
    
    mutating func clearQuotes() {
        quotes = []
    }

    mutating func addQuote(newquote: Quote) {
        quotes.append(newquote)
    }
    
    mutating func addQuotes(newquotes: [Quote]) {
        quotes.append(contentsOf: newquotes)
    }
}

struct OnlineService {
    var version:   String
    var service:   String
    var generated: String
    var authors:  [Author]
    
    init() {
        version   = ""
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

//
// eol
//
