//
//  RichTextFormatToolbarBase.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2024-02-16.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This internal protocol is used to share code between the
/// two toolbars, which should eventually become one.
protocol RichTextFormatToolbarBase: View {

    var config: RichTextFormat.ToolbarConfig { get }
    var style: RichTextFormat.ToolbarStyle { get }
}

extension RichTextFormatToolbarBase {

    @ViewBuilder
    func styleToggleGroup(
        for context: RichTextContext
    ) -> some View {
        if !config.styles.isEmpty {
            RichTextStyle.ToggleGroup(
                context: context,
                styles: config.styles
            )
        }
    }
}
