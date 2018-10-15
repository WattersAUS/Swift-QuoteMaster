//
//  ConfigurationDelegate.swift
//  Quote Master
//
//  Created by Graham Watson on 07/10/2018.
//  Copyright © 2018 Graham Watson. All rights reserved.
//

import Foundation

//----------------------------------------------------------------------------
// defines:
// URL's that define how we connect to the token / quotes services
// The tokens used
// When the quotes were last refreshed
//----------------------------------------------------------------------------

import Foundation

protocol ConfigurationDelegate: class {
    var tokenService:   String { get }
    var accessToken:    String { get }
    var quoteService:   String { get }
    var quoteToken:     String { get set }
    var lastUpdated:    String { get set }
}

class ConfigurationHandler: NSObject, ConfigurationDelegate {
    var tokenService:   String
    var accessToken:    String
    var quoteService:   String
    var quoteToken:     String
    var lastUpdated:    String
    
    let userDefaults: UserDefaults = UserDefaults.standard
    
    override init() {
        self.tokenService  = self.userDefaults.string(forKey: "tokenService")!
        self.accessToken   = self.userDefaults.string(forKey: "accessToken")!
        self.quoteService  = self.userDefaults.string(forKey: "quoteService")!
        self.quoteToken    = self.userDefaults.string(forKey: "quoteToken")!
        self.lastUpdated   = self.userDefaults.string(forKey: "lastUpdated")!
        return
    }
    
    func saveConfiguration() -> (Void) {
        self.userDefaults.set(self.tokenService, forKey: "tokenService")
        self.userDefaults.set(self.accessToken, forKey: "accessToken")
        self.userDefaults.set(self.quoteService, forKey: "quoteService")
        self.userDefaults.set(self.quoteToken, forKey: "quoteToken")
        self.userDefaults.set(self.lastUpdated, forKey: "lastUpdated")
        return
    }
    
}


