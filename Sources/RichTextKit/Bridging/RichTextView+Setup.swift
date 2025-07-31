//
//  RichTextView+Setup.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2024-03-04.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

extension RichTextView {
    fileprivate static let defaultFont = FontRepresentable.preferredFont(forTextStyle: .body)

    func setupSharedBehavior(with text: NSAttributedString) {
        // If the text has no font attributes, add a default font
        if text.length > 0 && text.attribute(.font, at: 0, effectiveRange: nil) == nil {
            let mutableText = NSMutableAttributedString(attributedString: text)
            mutableText.addAttribute(.font, value: Self.defaultFont, range: NSRange(location: 0, length: text.length))
            attributedString = mutableText
        } else {
            attributedString = text
        }
        
        setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        // Ensure we have default typing attributes including a font
        if typingAttributes[.font] == nil {
            typingAttributes[.font] = Self.defaultFont
        }
    }
}
