//
//  RichTextFormat+ToolbarConfig.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2024-02-16.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

#if iOS || macOS || os(visionOS)
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

public extension RichTextFormat.ToolbarConfig {

    /// The standard rich text format toolbar configuration.
    static var standard: Self { .init() }
}

public extension View {

    /// Apply a rich text format toolbar style.
    func richTextFormatToolbarConfig(
        _ value: RichTextFormat.ToolbarConfig
    ) -> some View {
        self.environment(\.richTextFormatToolbarConfig, value)
    }
}

private extension RichTextFormat.ToolbarConfig {

    struct Key: EnvironmentKey {

        public static var defaultValue: RichTextFormat.ToolbarConfig {
            .init()
        }
    }
}

public extension EnvironmentValues {

    /// This value can bind to a format toolbar config.
    var richTextFormatToolbarConfig: RichTextFormat.ToolbarConfig {
        get { self [RichTextFormat.ToolbarConfig.Key.self] }
        set { self [RichTextFormat.ToolbarConfig.Key.self] = newValue }
    }
}
#endif
