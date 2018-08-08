//
//  RandomQuoteViewController.swift
//  Quote Master
//
//  Created by Graham Watson on 08/08/2018.
//  Copyright © 2018 Graham Watson. All rights reserved.
//

import Cocoa

class RandomQuoteViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
   
}

extension RandomQuoteViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> RandomQuoteViewController {
        //1.
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        //2.
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "RandomQuoteViewController")
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? RandomQuoteViewController else {
            fatalError("Why cant i find RandomQuoteViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}
