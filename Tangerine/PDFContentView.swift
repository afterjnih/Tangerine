//
//  PDFContentView.swift
//  Tangerine2
//
//  Created by Koji Ota on 2016/01/08.
//  Copyright © 2016年 Koji Ota. All rights reserved.
//

import Cocoa
import Quartz

class PDFContentView: PDFView {
	private let downKey: UInt16 = 125
	private let upKey: UInt16 = 126
	private let rightKey: UInt16 = 124
	private let leftKey: UInt16 = 123
	private let hKey: UInt16 = 4
	private let jKey: UInt16 = 38
	private let kKey: UInt16 = 40
	private let lKey: UInt16 = 37
	
	override func drawRect(dirtyRect: NSRect) {
		super.drawRect(dirtyRect)
		
		// Drawing code here.
	}
	override func keyDown(theEvent: NSEvent) {
		Swift.print("pdfview")
		Swift.print(theEvent.keyCode)
		switch theEvent.keyCode {
		case jKey, lKey, downKey, rightKey :
			goToNextPage(self.document())
		case hKey, kKey, upKey, leftKey :
			goToPreviousPage(self.document())
		default:
			break
		}
	}
}
