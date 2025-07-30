//
//  RichTextView+Setup.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2024-03-04.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

extension RichTextView {

    func setupSharedBehavior(
        with text: NSAttributedString,
    ) {
        attributedString = .empty
        attributedString = text
        setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
}
