//
//  RichTextCoordinator+SubscriptionsTests.swift
//  RichTextKitTests
//
//  Created by Daniel Saidi on 2022-12-05.
//  Copyright © 2022-2023 Daniel Saidi. All rights reserved.
//

import RichTextKit
import SwiftUI
import XCTest

@MainActor
final class RichTextCoordinator_SubscriptionsTests: XCTestCase {

    private var text: NSAttributedString!
    private var textBinding: Binding<NSAttributedString>!
    private var textView: RichTextView!
    private var textContext: RichTextContext!
    private var coordinator: RichTextCoordinator!

    override func setUp() {
        super.setUp()

        text = NSAttributedString(string: "foo bar baz")
        textBinding = Binding(get: { self.text }, set: { self.text = $0 })
        textView = RichTextView()
        textContext = RichTextContext()
        coordinator = RichTextCoordinator(
            text: textBinding,
            textView: textView,
            richTextContext: textContext)
        textView.selectedRange = NSRange(location: 0, length: 1)
    }

    override func tearDown() {
        text = nil
        textBinding = nil
        textView = nil
        textContext = nil
        coordinator = nil

        super.tearDown()
    }

    func testTextCoordinatorIsNeededForUpdatesToTakePlace() {
        XCTAssertNotNil(coordinator)
    }

    func testIsBoldUpdatesTextView() {
        XCTAssertFalse(textView.richTextStyles.hasStyle(.bold))
        textContext.actionPublisher.send(.setStyle(.bold, true))
        XCTAssertTrue(textView.richTextStyles.hasStyle(.bold))
    }

    func testIsItalicUpdatesTextView() {
        XCTAssertFalse(textView.richTextStyles.hasStyle(.italic))
        textContext.actionPublisher.send(.setStyle(.italic, true))
        XCTAssertTrue(textView.richTextStyles.hasStyle(.italic))
    }

    func testIsUnderlinedUpdatesTextView() {
        XCTAssertFalse(textView.richTextStyles.hasStyle(.underlined))
        textContext.actionPublisher.send(.setStyle(.underlined, true))
        XCTAssertTrue(textView.richTextStyles.hasStyle(.underlined))
    }

    func testIsStrikeThroughUpdatesTextView() {
        XCTAssertFalse(textView.richTextStyles.hasStyle(.strikethrough))
        textContext.actionPublisher.send(.setStyle(.strikethrough, true))
        XCTAssertTrue(textView.richTextStyles.hasStyle(.strikethrough))
    }

    func testSelectedRangeChangeUpdatesTextView() {
        let range = NSRange(location: 4, length: 3)
        textContext.selectRange(range)
        XCTAssertEqual(textView.selectedRange, range)
    }

}
