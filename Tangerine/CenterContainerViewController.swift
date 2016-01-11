//
//  CenterContainerViewController.swift
//  Tangerine
//
//  Created by Koji Ota on 2016/01/08.
//  Copyright © 2016年 Koji Ota. All rights reserved.
//

import Cocoa
import Quartz
class CenterContainerViewController: NSViewController, WindowControllerDelegate {

	@IBOutlet weak var contentView: PDFContentView!
	var pdf: PDFDocument!
	var windowController: WindowController!
	override var acceptsFirstResponder: Bool { return true }
  override func viewDidLoad() {
      super.viewDidLoad()
    	let PDFViewChangedPageNotification = "PDFViewChangedPage"
  		let notificationHandler = NSNotificationCenter.defaultCenter()
		  notificationHandler.addObserver(
				self,
				selector: "getPageNotification:",
				name: PDFViewChangedPageNotification,
				object: contentView)
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
		print("centerContainerViewController viewWillAppear!")
		windowController = self.view.window!.windowController! as? WindowController
		windowController.delegate = self
		if let doc = windowController.document as? Document {
  		pdf = PDFDocument(URL: doc.url)
  		self.contentView.setDocument(pdf)
		}
	}
	override func viewDidAppear() {
		print("ContentViewController viewDidAppear!!")
	}
	func getPageNotification(notification: NSNotification) {
		if let windowCt = windowController {
  		windowCt.updatePageLabel(contentView.currentPageLabel())
		}
	}
	func whichPage(pageLabel: String) {
		if let doc = windowController.document as? Document {
			if let labelPage = doc.labelPage {
				if let label = labelPage[pageLabel] {
    			self.contentView.goToPage(pdf.pageAtIndex(label))
				}
			}
		}
	}
}
