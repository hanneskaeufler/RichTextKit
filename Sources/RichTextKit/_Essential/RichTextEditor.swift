//
//  RichTextEditor.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-21.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to view and edit rich text in SwiftUI.

 The view uses a platform-specific ``RichTextView`` together
 with a ``RichTextContext`` and a ``RichTextCoordinator`` to
 keep the view and context in sync.

 You can use the provided context to trigger and observe any
 changes to the text editor. Note that changing the value of
 the `text` binding will not yet update the editor. Until it
 is fixed, use `setAttributedString(to:)`.

 You can configure and style the view by applying its config
 and style view modifiers to your view hierarchy:

 ```swift
 VStack {
    RichTextEditor(...)
    ...
 }
 ```

 For more information, see ``RichTextKeyboardToolbarConfig``
 and ``RichTextKeyboardToolbarStyle``.
 */
public struct RichTextEditor: NSViewRepresentable {

    /// Create a rich text editor with a rich text value and
    /// a certain rich text data format.
    ///
    /// - Parameters:
    ///   - text: The rich text to edit.
    ///   - context: The rich text context to use.
    ///   - format: The rich text data format, by default `.archivedData`.
    ///   - viewConfiguration: A platform-specific view configuration, if any.
    public init(
        text: Binding<NSAttributedString>,
        context: RichTextContext,
        viewConfiguration: @escaping ViewConfiguration = { _ in }
    ) {
        self.text = text
        self._context = ObservedObject(wrappedValue: context)
        self.viewConfiguration = viewConfiguration
    }

    public typealias ViewConfiguration = (RichTextViewComponent) -> Void

    @ObservedObject
    private var context: RichTextContext

    private var text: Binding<NSAttributedString>
    private var viewConfiguration: ViewConfiguration

    public let scrollView = RichTextView.scrollableTextView()

    public var textView: RichTextView {
        scrollView.hasVerticalScroller = true
        return scrollView.documentView as? RichTextView ?? RichTextView()
    }

    public func makeCoordinator() -> RichTextCoordinator {
        RichTextCoordinator(
            text: text,
            textView: textView,
            richTextContext: context
        )
    }

    public func makeNSView(context: Context) -> some NSView {
        textView.setup(with: text.wrappedValue)
        viewConfiguration(textView)
        return scrollView
    }

    public func updateNSView(_ view: NSViewType, context: Context) {}
}

// MARK: RichTextPresenter

public extension RichTextEditor {

    /// Get the currently selected range.
    var selectedRange: NSRange {
        textView.selectedRange
    }
}

// MARK: RichTextReader

public extension RichTextEditor {

    /// Get the string that is managed by the editor.
    var attributedString: NSAttributedString {
        text.wrappedValue
    }
}

// MARK: RichTextWriter

public extension RichTextEditor {

    /// Get the mutable string that is managed by the editor.
    var mutableAttributedString: NSMutableAttributedString? {
        textView.mutableAttributedString
    }
}
