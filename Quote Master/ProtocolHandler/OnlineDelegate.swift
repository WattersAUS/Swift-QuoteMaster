//
//  OnlineDelegate.swift
//  Quote Master
//
//  Created by Graham Watson on 13/08/2018.
//  Copyright © 2018 Graham Watson. All rights reserved.
//
//----------------------------------------------------------------------------
// online downloaded results
//----------------------------------------------------------------------------

import Foundation

protocol OnlineDelegate: class {
    var service: OnlineService! { get set }
}

class OnlineDelegateHandler: NSObject, OnlineDelegate {
    
    private var OnlineData: [String: AnyObject]!
    internal var service: OnlineService!
    internal var online:  Bool = false
    
    override init() {
        super.init()
        self.OnlineData = [:]
        self.service    = OnlineService()
        self.online     = false
        return
    }
    
    //-------------------------------------------------------------------------------
    // pick out the dictionary 'keys/value' when we load the results
    // if we don't yet have a value return a default
    //-------------------------------------------------------------------------------
    private func extractHeaderValue(keyValue: serviceHeader) -> String {
        return (self.OnlineData.index(forKey: keyValue.rawValue) == nil) ? "" : self.OnlineData[keyValue.rawValue] as! String
    }

    private func extractHeaderValue(keyValue: serviceHeader) -> [[String: AnyObject]] {
        return (self.OnlineData.index(forKey: keyValue.rawValue) == nil) ? ([[:]]) : self.OnlineData[keyValue.rawValue] as! [[String : AnyObject]]
    }
    
    private func extractServiceValue(keyValue: serviceType) -> String {
        return (self.OnlineData.index(forKey: keyValue.rawValue) == nil) ? "" : self.OnlineData[keyValue.rawValue] as! String
    }
    
    //-------------------------------------------------------------------------------
    // parse through the JSON Object and extract details
    //-------------------------------------------------------------------------------
    private func loadQuotesFromJSON() {
        
        func decodeAuthorsFromResponse(array: [[String: AnyObject]]) -> [Author] {
            
            func decodeQuotesFromResponse(array: [[String: AnyObject]]) -> [Quote] {
                var quotes: [Quote] = []
                for quote: [String: AnyObject] in array {
                    var instance: Quote = Quote()
                    for (key,value) in quote {
                        switch key {
                        case serviceQuote.Id.rawValue:
                            instance.id = value as! Int
                            break
                        case serviceQuote.Text.rawValue:
                            instance.text = value as! String
                            break
                        case serviceQuote.Added.rawValue:
                            break
                        case serviceQuote.Used.rawValue:
                            break
                        default:
                            break
                        }
                    }
                    quotes.append(instance)
                }
                return quotes
            }
            
            var authors: [Author] = []
            for author: [String: AnyObject] in array {
                var instance: Author = Author()
                for (key,value) in author {
                    switch key {
                    case serviceAuthor.Id.rawValue:
                        instance.id = value as! Int
                        break
                    case serviceAuthor.Name.rawValue:
                        instance.name = value as! String
                        break
                    case serviceAuthor.Period.rawValue:
                        break
                    case serviceAuthor.Quotes.rawValue:
                        instance.quotes = decodeQuotesFromResponse(array: value as! [[String: AnyObject]])
                        break
                    default:
                        break
                    }
                }
                authors.append(instance)
                
            }
            return authors
        }
        
        self.service.version   = self.extractHeaderValue(keyValue: serviceHeader.Version)
        self.service.service   = self.extractHeaderValue(keyValue: serviceHeader.Service)
        self.service.generated = self.extractHeaderValue(keyValue: serviceHeader.GenDate)
        self.service.authors.append(contentsOf: decodeAuthorsFromResponse(array: self.extractHeaderValue(keyValue: serviceHeader.Authors)))
        return
    }
    
    func loadOnlineResults() {
        do {
            let jsonFile = try String(contentsOf: URL(string: "https://www.shiny-ideas.tech/qws/quotes/5144aad8-b317-11e7-a9d6-00163eee1df8/")!)
            let fileData: Data = jsonFile.data(using: String.Encoding.utf8, allowLossyConversion: false)!
            self.OnlineData = try JSONSerialization.jsonObject(with: fileData, options: .allowFragments) as! Dictionary<String, AnyObject>
            self.loadQuotesFromJSON()
            self.online = true
        } catch {
            self.online = false
        }
        return
    }
}
