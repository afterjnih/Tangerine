//
//  CenterContainerViewController.swift
//  Tangerine
//
//  Created by Koji Ota on 2016/01/08.
//  Copyright © 2016年 Koji Ota. All rights reserved.
//

import Cocoa
import Quartz
class CenterContainerViewController: NSViewController {

	@IBOutlet weak var contentView: PDFContentView!
	var pdf: PDFDocument!
	var wc: WindowController!
	override var acceptsFirstResponder: Bool { return true }
  override func viewDidLoad() {
      super.viewDidLoad()
    	let PDFViewChangedPageNotification = "PDFViewChangedPage"
  		let notificationHandler = NSNotificationCenter.defaultCenter();
		  notificationHandler.addObserver(self, selector: "getPageNotification:", name: PDFViewChangedPageNotification, object: contentView)
  }
	override var representedObject: AnyObject? {
		didSet {
			// Update the view, if already loaded.
		}
	}
	override func loadView() {
		super.loadView()
	}
	
  override func viewWillAppear() {
		print("centerContainerViewController viewWillAppear!");
		wc = self.view.window!.windowController! as! WindowController
		let doc = wc.document as! Document
		pdf = PDFDocument(URL: doc.url)
		let outline = pdf.outlineRoot()
		self.contentView.setDocument(pdf)
	}
	
	override func viewDidAppear() {
		print("ContentViewController viewDidAppear!!");
	}
	
	func getPageNotification(notification: NSNotification) {
		wc.updatePageLabel(contentView.currentPageLabel());
	}
}
