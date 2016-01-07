//
//  CenterContainerViewController.swift
//  Tangerine2
//
//  Created by Koji Ota on 2016/01/08.
//  Copyright © 2016年 Koji Ota. All rights reserved.
//

import Cocoa
import Quartz
class CenterContainerViewController: NSViewController {

	@IBOutlet weak var contentView: PDFView!
	var pdf: PDFDocument!
	override var acceptsFirstResponder: Bool { return true }
  override func viewDidLoad() {
      super.viewDidLoad()
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
		print("centerContainerViewController viewWillAppear");
		let wc = self.view.window!.windowController! as NSWindowController
		let doc = wc.document as! Document
		pdf = PDFDocument(URL: doc.url)
		self.contentView.setDocument(pdf)
//		self.representedObject = doc
	}
}
