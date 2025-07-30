//
//  RichTextFormat+Toolbar.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-12-13.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension RichTextFormat {

    struct Toolbar: View {

        /**
         Create a rich text format sheet.

         - Parameters:
         - context: The context to apply changes to.
         */
        public init(
            context: RichTextContext
        ) {
            self._context = ObservedObject(wrappedValue: context)
        }

        @ObservedObject
        private var context: RichTextContext

        var config = RichTextFormat.ToolbarConfig()

        public var body: some View {
            VStack(spacing: 10) {
                HStack {
                    HStack {
                        RichTextStyle.ToggleGroup(
                            context: context,
                            styles: config.styles
                        )
                    }
                }
                .padding(.horizontal, 10)
            }
            .labelsHidden()
            .padding(.vertical, 10)
            .background(
                Color.clear
                .overlay(Color.primary.opacity(0.1))
                .shadow(color: .black.opacity(0.1), radius: 5)
                .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

#Preview {

    struct Preview: View {

        @StateObject
        private var context = RichTextContext()

        var body: some View {
            VStack(spacing: 0) {
                Color.red
                RichTextFormat.Toolbar(context: context)
            }
        }
    }

    return Preview()
}
