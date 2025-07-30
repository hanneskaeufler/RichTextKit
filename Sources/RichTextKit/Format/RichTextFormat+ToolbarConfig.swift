//
//  RichTextFormat+ToolbarConfig.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2024-02-16.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension RichTextFormat {

    /// This type can be used to configure a format toolbar.
    struct ToolbarConfig {

        public init(
            styles: [RichTextStyle] = .all,
        ) {
            self.styles = styles
        }

        public var styles: [RichTextStyle]
    }
}
