//
//  RootViewController.swift
//  Statusbar-View-App
//
//  Created by Jorge Paez on 4/20/16.
//  Copyright © 2016 Jorge Paez. All rights reserved.
//

import Cocoa

class RootViewController: NSViewController {
    
    let kCornerRadius: CGFloat = 5.0
    let kBorderWidth: CGFloat = 2.0
    let kBorderUnselectedColor: CGColor = NSColor.whiteColor().CGColor
    let kBorderSelectedColor: CGColor = NSColor.greenColor().CGColor
    let kAlphaValue: CGFloat = 0.50
    
    @IBOutlet weak var cancelButton: NSButton?
    @IBOutlet weak var startPauseButton: NSButton?
    @IBOutlet weak var hoursTextfield: NSTextField?
    @IBOutlet weak var minutesTextfield: NSTextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        hoursTextfield?.wantsLayer = true
        hoursTextfield?.layer?.borderColor = kBorderUnselectedColor
        hoursTextfield?.layer?.cornerRadius = kCornerRadius
        hoursTextfield?.layer?.borderWidth = kBorderWidth
        
        minutesTextfield?.wantsLayer = true
        minutesTextfield?.layer?.borderColor = kBorderUnselectedColor
        minutesTextfield?.layer?.cornerRadius = kCornerRadius
        minutesTextfield?.layer?.borderWidth = kBorderWidth
        
        cancelButton?.alphaValue = kAlphaValue
        startPauseButton?.alphaValue = kAlphaValue
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
    }
    
    @IBAction func clickedOnControlAction(sender: AnyObject?) {
        let button: NSClickGestureRecognizer = sender as! NSClickGestureRecognizer
        if button == hoursTextfield {
            hoursTextfield?.layer?.borderColor = kBorderSelectedColor
        } else {
            minutesTextfield?.layer?.borderColor = kBorderSelectedColor
        }
        
        /*if let textfield = sender {
            if textfield as? NSTextField == hoursTextfield {
                hoursTextfield?.layer?.borderColor = kBorderSelectedColor
            } else if textfield as? NSTextField == minutesTextfield {
                minutesTextfield?.layer?.borderColor = kBorderSelectedColor
            }
        }*/
    }
}
