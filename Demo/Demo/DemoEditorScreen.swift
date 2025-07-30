//
//  DemoEditorScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2024-03-04.
//  Copyright © 2024 Kankoda Sweden AB. All rights reserved.
//

import RichTextKit
import SwiftUI

struct DemoEditorScreen: View {

    @State var document: NSAttributedString = .empty

    @State private var isInspectorPresented = false

    @StateObject var context = RichTextContext()

    var body: some View {
        VStack(spacing: 0) {
            RichTextFormat.Toolbar(context: context)
            RichTextEditor(
                text: $document,
                context: context
            ) {
                $0.textContentInset = CGSize(width: 30, height: 30)
            }
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Toggle(isOn: $isInspectorPresented) {
                    Image.richTextFormatBrush
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
        .frame(minWidth: 500)
        .focusedValue(\.richTextContext, context)
        .toolbarRole(.automatic)
        .richTextFormatToolbarConfig(.init())
        .viewDebug()
        .onChange(of: document) { oldValue, newValue in
            print("FIRE")
        }
    }
}

private extension DemoEditorScreen {

    var isMac: Bool {
        true
    }

    var formatToolbarEdge: VerticalEdge {
        isMac ? .top : .bottom
    }
}

#Preview {
    DemoEditorScreen(
        context: .init()
    )
}
