//
//  TokenServiceDelegate.swift
//  Quote Master
//
//  Created by Graham Watson on 07/10/2018.
//  Copyright © 2018 Graham Watson. All rights reserved.
//
//----------------------------------------------------------------------------
// when we get a new access token
//----------------------------------------------------------------------------

import Foundation

protocol TokenServiceDelegate: class {
    var service: NewTokenService! { get set }
}

class TokenDelegateHandler: NSObject, TokenServiceDelegate {
    internal var service:   NewTokenService!
    internal var online:    Bool = false
    
    override init() {
        super.init()
        self.online = false
        self.getNewToken()
        return
    }
    
    func decodeJSON(data: Data!) -> NewTokenService! {
        var service: NewTokenService! = nil
        let decoder = JSONDecoder()
        do {
            try service = decoder.decode(NewTokenService.self, from: data)
            self.online = true
        } catch let error as NSError {
            self.online = false
        }
        return service
    }
    
    func getNewToken() {
        do {
            let jsonFile = try String(contentsOf: URL(string: "NEW-TOKEN-SERVICE-GOES-HERE")!)
            let fileData: Data = jsonFile.data(using: String.Encoding.utf8, allowLossyConversion: false)!
            self.service = self.decodeJSON(data: fileData)
        } catch {
            self.online = false
        }
    }
}
