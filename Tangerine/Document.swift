//
//  Document.swift
//  Tangerine
//
//  Created by Koji Ota on 2016/01/08.
//  Copyright © 2016年 Koji Ota. All rights reserved.
//

import Cocoa
import Quartz

class Document: NSPersistentDocument {
	var url: NSURL?
	var labelPage: [String: Int]?
	override init() {
		print("Document init")
    super.init()
		// Add your subclass-specific initialization here.
	}

	override func windowControllerDidLoadNib(aController: NSWindowController) {
		print("Document windowControllerDidLoadNib")
		super.windowControllerDidLoadNib(aController)
		// Add any code here that needs to be executed once the windowController has loaded the document's window.
	}

	override class func autosavesInPlace() -> Bool {
		return true
	}

	override func makeWindowControllers() {
		// Returns the Storyboard that contains your Document window.
		print("Document makeWindowControllers")
		let storyboard = NSStoryboard(name: "Main", bundle: nil)
		if let windowController = storyboard.instantiateControllerWithIdentifier("Document Window Controller") as? NSWindowController {
  		self.addWindowController(windowController)
		}
	}
	override func readFromURL(url: NSURL, ofType typeName: String) throws {
		print("Document readFromURL")
		setValue(url, forKey: "url")
		labelPage = labelPages(PDFDocument(URL: url))
		print(PDFDocument(URL: url).outlineRoot())
		print(PDFDocument(URL: url).pageCount())
		print(PDFDocument(URL: url).pageAtIndex(416))
		print(PDFDocument(URL: url).outlineRoot().childAtIndex(2))
	}
	func labelPages(pdfDocument: PDFDocument) -> [String: Int] {
		let pageNum = pdfDocument.pageCount()
		var labelPage: Dictionary<String, Int> = [:]
		for var pageCount = 0;  pageCount < pageNum; ++pageCount {
			labelPage[pdfDocument.pageAtIndex(pageCount).label()] = pageCount
		}
		return labelPage
	}
}
