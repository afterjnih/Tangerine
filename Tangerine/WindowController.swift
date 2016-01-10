//
//  WindowController.swift
//  Tangerine
//
//  Created by Koji Ota on 2016/01/08.
//  Copyright © 2016年 Koji Ota. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
	@IBOutlet weak var pageLabel: NSTextField!
    override func windowDidLoad() {
			print("WindowController windowDidLoad")
        super.windowDidLoad()
			pageLabel.stringValue = "012"
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
	func updatePageLabel(pageLabel: String) {
		 self.pageLabel.stringValue = pageLabel
	}

}
