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

struct TokenService: Codable {
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

    func getVersion() -> String {
        return self.version
    }
    
    func getService() -> String {
        return self.service
    }
    
    func getGenerated() -> String {
        return self.generated
    }
    
    func getToken() -> String {
        return self.token
    }
}

protocol TokenServiceDelegate: class {
    var token: TokenService! { get set }
}

class TokenDelegateHandler: NSObject, TokenServiceDelegate {
    internal var token:   TokenService!
    internal var useable: Bool = false

    init(data: Data!) {
        super.init()
        do {
            let decoder    = JSONDecoder()
            try self.token = decoder.decode(TokenService.self, from: data)
            self.useable   = true
        } catch _ as NSError {
            self.token   = nil
            self.useable = false
        }
        return
    }    

    func getVersionString() -> String {
        guard self.useable == true || self.token != nil else {
            return ""
        }
        return self.token.getVersion()
    }
    
    func getServiceName() -> String {
        guard self.useable == true || self.token != nil else {
            return ""
        }
        return self.token.getService()
    }
    
    func getGeneratedDate() -> String {
        guard self.useable == true || self.token != nil else {
            return ""
        }
        return self.token.getGenerated()
    }
    
    func getToken() -> String {
        guard self.useable == true || self.token != nil else {
            return ""
        }
        return self.token.getToken()
    }
}
