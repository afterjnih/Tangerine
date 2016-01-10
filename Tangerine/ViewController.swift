//
//  ViewController.swift
//  Tangerine
//
//  Created by Koji Ota on 2016/01/08.
//  Copyright © 2016年 Koji Ota. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	override func viewDidLoad() {
		print("viewController viewDidLoad")
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}
  override func viewWillAppear() {
		print("viewController viewWillAppear")
	}
	override var representedObject: AnyObject? {
		didSet {
		// Update the view, if already loaded.
		}
	}

	override func loadView() {
		print("viewController loadView")
		super.loadView()
	}

}
