//
//  Enumerations.swift
//  Quote Master
//
//  Created by Graham Watson on 09/09/2018.
//  Copyright © 2018 Graham Watson. All rights reserved.
//

import Foundation

//
// Dictionary tabs to be used when translating the JSON payload from the service
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
