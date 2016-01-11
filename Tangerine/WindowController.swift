//
//  WindowController.swift
//  Tangerine
//
//  Created by Koji Ota on 2016/01/08.
//  Copyright © 2016年 Koji Ota. All rights reserved.
//

import Cocoa

@objc protocol WindowControllerDelegate {
	func whichPage(pageLabel: String)
}

class WindowController: NSWindowController {
	weak var delegate: WindowControllerDelegate?
	@IBOutlet weak var pageLabel: NSTextField!
    override func windowDidLoad() {
			print("WindowController windowDidLoad")
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
	func updatePageLabel(pageLabel: String) {
		 self.pageLabel.stringValue = pageLabel
	}

}

extension WindowController {
	@IBAction func goTo(sender: AnyObject) {
		self.delegate?.whichPage(self.pageLabel.stringValue)
	}
}
