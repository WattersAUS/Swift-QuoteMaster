//
//  AppDelegate.swift
//  Quote Master
//
//  Created by Graham Watson on 08/08/2018.
//  Copyright © 2018 Graham Watson. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    let popover    = NSPopover()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named:"Pen")
            button.action = #selector(randomQuote(_:))
        }
        // get new quotes
        self.getLatestQuotes()
        self.buildMenu()
    }
    
//    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        if let button = statusItem.button {
//            button.image = NSImage(named:NSImage.Name("Pen"))
//            button.action = #selector(togglePopover(_:))
//        }
//        popover.contentViewController = RandomQuoteViewController.freshController()
//    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func getLatestQuotes() {
        // check we can see program defaults
//        let siAccess = Bundle.main.object(forInfoDictionaryKey: "SI-Domain") as! String + (Bundle.main.object(forInfoDictionaryKey: "SI-Access-URL") as! String)
//        let siQuote  = Bundle.main.object(forInfoDictionaryKey: "SI-Domain") as! String + (Bundle.main.object(forInfoDictionaryKey: "SI-All-Quote-URL") as! String)
    }
    
    @objc func randomQuote(_ sender: Any?) {
        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
        let quoteAuthor = "Mark Twain"
        
        print("\(quoteText) — \(quoteAuthor)")
    }
    
    @objc func showAuthors(_ sender: Any?) {
        print("showAuthors")
    }
    
    func buildMenu() {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Random Quote", action: #selector(AppDelegate.randomQuote(_:)), keyEquivalent: "R"))
        menu.addItem(NSMenuItem(title: "Show Authors", action: #selector(AppDelegate.showAuthors(_:)), keyEquivalent: "A"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit Quote Master", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu
    }

//    @objc func togglePopover(_ sender: Any?) {
//        if popover.isShown {
//            closePopover(sender: sender)
//        } else {
//            showPopover(sender: sender)
//        }
//    }
//
//    func showPopover(sender: Any?) {
//        if let button = statusItem.button {
//            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
//        }
//    }
//
//    func closePopover(sender: Any?) {
//        popover.performClose(sender)
//    }
    
}
