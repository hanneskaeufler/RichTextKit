//
//  RichTextViewComponent+Font.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-29.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

/// These functions may seem complicated, but it is the only
/// way that seems to work correctly, so far.
///
/// I previously grabbed the `typingAttributes` and took the
/// `.font` attribute from it, then took its `fontDescriptor`
/// and created a new font with `withFamily`, then created a
/// new font with the new descriptor and old size.
///
/// That approach however fails since the San Francisco font
/// specifies a certain usage, that casuses the font name to
/// not apply. This code just creates a new font instead, so
/// be aware if something doesn't work as expected.
///
/// After removing the ``RichTextAttributeWriter`` in 1.0 we
/// can hopefully iterate more consistently on the extension.

import CoreGraphics
import Foundation
import AppKit

public extension RichTextViewComponent {

    /// Get the rich text font at current range.
    var richTextFont: FontRepresentable? {
        NSFont.preferredFont(forTextStyle: .body)
    }

}
