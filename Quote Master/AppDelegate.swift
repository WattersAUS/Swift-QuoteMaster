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

//    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        // Insert code here to initialize your application
//        if let button = statusItem.button {
//            button.image = NSImage(named:NSImage.Name("Pen"))
//            button.action = #selector(printQuote(_:))
//        }
//        constructMenu()
//    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("Pen"))
            button.action = #selector(togglePopover(_:))
        }
        popover.contentViewController = RandomQuoteViewController.freshController()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func printQuote(_ sender: Any?) {
        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
        let quoteAuthor = "Mark Twain"
        
        print("\(quoteText) — \(quoteAuthor)")
    }
    
//    func constructMenu() {
//        let menu = NSMenu()
//        menu.addItem(NSMenuItem(title: "Random Quote", action: #selector(AppDelegate.printQuote(_:)), keyEquivalent: "P"))
//        menu.addItem(NSMenuItem.separator())
//        menu.addItem(NSMenuItem(title: "Quit Quote Master", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
//        statusItem.menu = menu
//    }

    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    func closePopover(sender: Any?) {
        popover.performClose(sender)
    }
    
}
