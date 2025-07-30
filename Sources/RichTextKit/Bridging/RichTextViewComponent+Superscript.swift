//
//  RichTextViewComponent+Color.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2024-02-14.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension RichTextViewComponent {

    /// Get the superscript level.
    var richTextSuperscriptLevel: Int? {
        richTextAttribute(.superscript)
    }

    /// Set the superscript level.
    func setRichTextSuperscriptLevel(to val: Int) {
        setRichTextAttribute(.superscript, to: val)
    }

    /// Step the superscript level.
    func stepRichTextSuperscriptLevel(points: Int) {
        let old = richTextSuperscriptLevel ?? 0
        let new = old + points
        setRichTextSuperscriptLevel(to: new)
    }
}
