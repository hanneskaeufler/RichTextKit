//
//  RichTextContextTests.swift
//  RichTextKit

//  Created by Daniel Saidi on 2022-12-06.
//  Copyright © 2022-2023 Daniel Saidi. All rights reserved.
//

import RichTextKit
import XCTest

final class RichTextContextTests: XCTestCase {

    func testInitializerSetsDefaultValues() {
        let context = RichTextContext()
        XCTAssertFalse(context.hasStyle(.bold))
        XCTAssertFalse(context.hasStyle(.italic))
        XCTAssertFalse(context.hasStyle(.underlined))
        XCTAssertFalse(context.hasStyle(.strikethrough))
        XCTAssertFalse(context.isEditingText)
        XCTAssertNil(context.highlightedRange)
        XCTAssertEqual(context.selectedRange.location, 0)
        XCTAssertEqual(context.selectedRange.length, 0)
    }

    func testStopEditingTextSetsPropertyToFalse() {
        let context = RichTextContext()
        context.isEditingText = true
        context.stopEditingText()
        XCTAssertFalse(context.isEditingText)
    }
}
