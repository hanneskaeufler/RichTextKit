//
//  RichTextViewComponent+StylesTest.swift
//  RichTextKitTests
//
//  Created by Daniel Saidi on 2022-12-06.
//  Copyright © 2022-2023 Daniel Saidi. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

import AppKit
import RichTextKit
import XCTest

final class RichTextViewComponent_StylesTests: XCTestCase {

    private var textView: RichTextViewComponent!

    private let noRange = NSRange(location: 0, length: 0)
    private let selectedRange = NSRange(location: 4, length: 3)

    override func setUp() {
        super.setUp()

        textView = RichTextView()
        textView.setup(
            with: NSAttributedString(string: "foo bar baz"),
        )
    }

    override func tearDown() {
        textView = nil

        super.tearDown()
    }

    func testBoldWorksForSelectedRange() {
        textView.setSelectedRange(selectedRange)
        textView.setRichTextStyle(.bold, to: true)
        XCTAssertTrue(textView.richTextStyles.hasStyle(.bold))
        textView.setSelectedRange(noRange)
        XCTAssertFalse(textView.richTextStyles.hasStyle(.bold))
    }

    func testItalicWorksForSelectedRange() {
        textView.setSelectedRange(selectedRange)
        textView.setRichTextStyle(.italic, to: true)
        XCTAssertTrue(textView.richTextStyles.hasStyle(.italic))
        textView.setSelectedRange(noRange)
        XCTAssertFalse(textView.richTextStyles.hasStyle(.italic))
    }

    func testUnderlinedWorksForSelectedRange() {
        textView.setSelectedRange(selectedRange)
        textView.setRichTextStyle(.underlined, to: true)
        XCTAssertTrue(textView.richTextStyles.hasStyle(.underlined))
        textView.setSelectedRange(noRange)
        XCTAssertFalse(textView.richTextStyles.hasStyle(.underlined))
    }

    func testUnderlinedWorksForNoSelectedRange() {
        textView.setSelectedRange(noRange)
        textView.setRichTextStyle(.underlined, to: true)
        textView.setSelectedRange(selectedRange)
        XCTAssertFalse(textView.richTextStyles.hasStyle(.underlined))
    }
}
