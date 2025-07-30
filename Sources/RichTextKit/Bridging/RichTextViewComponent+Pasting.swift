//
//  RichTextViewComponent+Pasting.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-06-05.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import Foundation

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#endif

public extension RichTextViewComponent {

    /**
     Paste text into the text view, at a certain index.

     - Parameters:
       - text: The text to paste.
       - index: The text index to paste at.
       - moveCursorToPastedContent: Whether or not the input
     cursor should be moved to the end of the pasted content,
     by default `false`.
     */
    func pasteText(
        _ text: String,
        at index: Int,
        moveCursorToPastedContent: Bool = false
    ) {
        let selected = selectedRange
        let isSelectedRange = (index == selected.location)
        let content = NSMutableAttributedString(attributedString: richText)
        let insertString = NSMutableAttributedString(string: text)
        let insertRange = NSRange(location: index, length: 0)
        let safeInsertRange = safeRange(for: insertRange)
        let safeMoveIndex = safeInsertRange.location + insertString.length
        let attributes = content.richTextAttributes(at: safeInsertRange)
        let attributeRange = NSRange(location: 0, length: insertString.length)
        let safeAttributeRange = safeRange(for: attributeRange)
        insertString.setRichTextAttributes(attributes, at: safeAttributeRange)
        content.insert(insertString, at: index)
        setRichText(content)
        if moveCursorToPastedContent {
            moveInputCursor(to: safeMoveIndex)
        } else if isSelectedRange {
            moveInputCursor(to: selected.location + text.count)
        }
    }
}
