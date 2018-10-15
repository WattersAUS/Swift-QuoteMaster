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

protocol QuoteServiceDelegate: class {
    var quotes: QuoteService! { get set }
}

class QuoteDelegateHandler: NSObject, QuoteServiceDelegate {
    internal var quotes:  QuoteService!
    internal var useable: Bool = false
    
    override init() {
        super.init()
//        (self.useable, self.quotes!) = self.loadQuotes()
        return
    }

    func decodeJSON(data: Data!) -> QuoteService! {
        var service: QuoteService! = nil
        do {
            let decoder = JSONDecoder()
            try service = decoder.decode(QuoteService.self, from: data)
        } catch let error as NSError {
            return nil
        }
        return service
    }

    func loadQuotes(url: String) -> (Bool, QuoteService) {
        var result: Bool = false
        var service: QuoteService! = nil
        do {
            let jsonFile = try String(contentsOf: URL(string: url)!)
            let fileData: Data = jsonFile.data(using: String.Encoding.utf8, allowLossyConversion: false)!
            service = self.decodeJSON(data: fileData)
            result = true
        } catch {
            result = false
        }
        return (result, service)
    }
}
