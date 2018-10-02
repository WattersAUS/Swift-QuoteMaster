//
//  Quote.swift
//  Quote Master
//
//  Created by Graham Watson on 09/09/2018.
//  Copyright © 2018 Graham Watson. All rights reserved.
//

import Foundation

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
        return
    }
}
