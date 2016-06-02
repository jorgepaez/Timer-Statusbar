//
//  AppDelegate.swift
//  Statusbar-View-App
//
//  Created by Jorge Paez on 4/18/16.
//  Copyright © 2016 Jorge Paez. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    //let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSSquareStatusItemLength)
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    let popover = NSPopover()
    var eventMonitor: EventMonitor?

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        popover.appearance = NSAppearance.init(named: NSAppearanceNameVibrantDark)
        //popover.appearance = NSAppearance.init(named: NSAppearanceNameAqua)
        
        if let button = statusItem.button {
            button.imagePosition = NSCellImagePosition.ImageLeft
            button.image = NSImage(named: "Timer-Icon")
            button.title = "Timer"
            button.action = #selector(AppDelegate.togglePopover(_:))
        }
        
        popover.contentViewController = RootViewController(nibName: "RootViewController", bundle: nil)
        
        eventMonitor = EventMonitor(mask: [.LeftMouseDownMask, .RightMouseDownMask]) { [unowned self] event in
            if self.popover.shown {
                self.closePopover(event)
            }
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func showPopover(sender: AnyObject?) {
        if let button = statusItem.button {
            popover.showRelativeToRect(button.bounds, ofView: button, preferredEdge: NSRectEdge.MinY)
            eventMonitor?.start()
        }
    }
    
    func closePopover(sender: AnyObject?) {
        popover.performClose(sender)
        eventMonitor?.stop()
    }
    
    func togglePopover(sender: AnyObject?) {
        if popover.shown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }
}