//
//  FontRepresentable.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-24.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import AppKit

/// This typealias bridges platform-specific fonts.
public typealias FontRepresentable = NSFont

public extension FontRepresentable {

    /// The standard font to use for rich text.
    static var standardRichTextFont: FontRepresentable {
        .preferredFont(forTextStyle: .body)
    }

    /// Create a new font by toggling a certain style.
    func toggling(
        _ style: RichTextStyle
    ) -> FontRepresentable? {
        .init(
            descriptor: fontDescriptor.byTogglingStyle(style),
            size: pointSize
        )
    }
}
