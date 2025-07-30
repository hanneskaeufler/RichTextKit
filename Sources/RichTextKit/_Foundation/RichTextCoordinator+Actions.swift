//
//  RichTextCoordinator+Actions.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-22.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

extension RichTextCoordinator {

    func handle(_ action: RichTextAction?) {
        guard let action else { return }
        switch action {
        case .copy: textView.copySelection()
        case .deleteSelectedText: textView.deleteText(in: textView.selectedRange)
        case .deleteText(let range): textView.deleteText(in: range)
        case .pasteText(let text): pasteText(text)
        case .redoLatestChange:
            textView.redoLatestChange()
            syncContextWithTextView()
        case .replaceSelectedText(let text): textView.replaceText(in: textView.selectedRange, with: text)
        case .replaceText(let range, let text): textView.replaceText(in: range, with: text)
        case .selectRange(let range): setSelectedRange(to: range)
        case .setAttributedString(let string): setAttributedString(to: string)
        case .setStyle(let style, let newValue): setStyle(style, to: newValue)
        case .toggleStyle(let style): textView.toggleRichTextStyle(style)
        case .undoLatestChange:
            textView.undoLatestChange()
            syncContextWithTextView()
        }
    }
}

extension RichTextCoordinator {

    func paste<T: RichTextInsertable>(_ data: RichTextInsertion<T>) {
        if let data = data as? RichTextInsertion<String> {
            pasteText(data)
        } else {
            print("Unsupported media type")
        }
    }

    func pasteText(_ data: RichTextInsertion<String>) {
        textView.pasteText(
            data.content,
            at: data.index,
            moveCursorToPastedContent: data.moveCursor
        )
    }

    func setAttributedString(to newValue: NSAttributedString?) {
        guard let newValue else { return }
        textView.setRichText(newValue)
    }

    func setIsEditable(to newValue: Bool) {
        if newValue == textView.isEditable { return }
        textView.isEditable = newValue
    }

    func setSelectedRange(to range: NSRange) {
        if range == textView.selectedRange { return }
        textView.selectedRange = range
    }

    func setStyle(_ style: RichTextStyle, to newValue: Bool) {
        let hasStyle = textView.richTextStyles.hasStyle(style)
        if newValue == hasStyle { return }
        textView.setRichTextStyle(style, to: newValue)
    }
}
