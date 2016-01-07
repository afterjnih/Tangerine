//
//  ViewController.swift
//  Tangerine2
//
//  Created by Koji Ota on 2016/01/08.
//  Copyright © 2016年 Koji Ota. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	override func viewDidLoad() {
		print("viewController viewDidLoad");
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}
  override func viewWillAppear() {
		print("viewController viewWillAppear");
		let wc = self.view.window!.windowController! as NSWindowController
		let doc = wc.document as! Document
//		print(doc.url);
		self.representedObject = doc

	}
	override var representedObject: AnyObject? {
		didSet {
		// Update the view, if already loaded.
		}
	}

	override func loadView() {
		print("viewController loadView");
		super.loadView()
	}

}

