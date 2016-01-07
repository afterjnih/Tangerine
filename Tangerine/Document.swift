//
//  Document.swift
//  Tangerine2
//
//  Created by Koji Ota on 2016/01/08.
//  Copyright © 2016年 Koji Ota. All rights reserved.
//

import Cocoa

class Document: NSPersistentDocument {
	var url: NSURL?
	override init() {
		print("Document init");
	    super.init()
		// Add your subclass-specific initialization here.
	}

	override func windowControllerDidLoadNib(aController: NSWindowController) {
		print("Document windowControllerDidLoadNib");
		super.windowControllerDidLoadNib(aController)
		// Add any code here that needs to be executed once the windowController has loaded the document's window.
	}

	override class func autosavesInPlace() -> Bool {
		return true
	}

	override func makeWindowControllers() {
		// Returns the Storyboard that contains your Document window.
		print("Document makeWindowControllers");
		let storyboard = NSStoryboard(name: "Main", bundle: nil)
		let windowController = storyboard.instantiateControllerWithIdentifier("Document Window Controller") as! NSWindowController
		self.addWindowController(windowController)
	}
	override func readFromURL(url: NSURL, ofType typeName: String) throws {
		print("Document readFromURL");
		setValue(url, forKey: "url");
	}

}