//
//  RichTextViewComponent+Attributes.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-29.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension RichTextViewComponent {

    /// Get the rich text font at current range.
    var richTextFont: FontRepresentable? {
        richTextAttributes[.font] as? FontRepresentable ?? typingAttributes[.font] as? FontRepresentable
    }

    /// Get all attributes.
    var richTextAttributes: RichTextAttributes {
        if hasSelectedRange {
            return richTextAttributes(at: selectedRange)
        }

        let range = NSRange(location: selectedRange.location - 1, length: 1)
        let safeRange = safeRange(for: range)
        return richTextAttributes(at: safeRange)
    }

    /// Get a certain attribute.
    func richTextAttribute<Value>(
        _ attribute: RichTextAttribute
    ) -> Value? {
        richTextAttributes[attribute] as? Value
    }

    /// Set a certain attribute.
    func setRichTextAttribute(
        _ attribute: RichTextAttribute,
        to value: Any
    ) {
        if hasSelectedRange {
            setRichTextAttribute(attribute, to: value, at: selectedRange)
        } else {
            typingAttributes[attribute] = value
        }
    }

    /// Set certain attributes.
    func setRichTextAttributes(
        _ attributes: RichTextAttributes
    ) {
        attributes.forEach { attribute, value in
            setRichTextAttribute(attribute, to: value)
        }
    }

    /// Replace current attributes with updated one
    func setNewRichTextAttributes(
        _ attributes: RichTextAttributes
    ) {
        typingAttributes = attributes
    }
}
