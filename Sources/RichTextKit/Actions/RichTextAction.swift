//
//  RichTextAction.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-12-08.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI
import Combine

/// This enum defines rich text actions that can be executed
/// on a rich text editor.
///
/// It's also a namespace for action-related types and views,
/// like ``RichTextAction/Button``.
public enum RichTextAction: Identifiable, Equatable, RichTextLabelValue {

    /// Copy the currently selected text, if any.
    case copy

    /// Delete the selected text.
    case deleteSelectedText

    /// Delete text in a certain range.
    case deleteText(in: NSRange)

    /// Paste plain text.
    case pasteText(RichTextInsertion<String>)

    /// Redo the latest undone change.
    case redoLatestChange

    /// Replace the selected text.
    case replaceSelectedText(with: NSAttributedString)

    /// Replace text in a certain range.
    case replaceText(in: NSRange, with: NSAttributedString)

    /// Select a range.
    case selectRange(NSRange)

    /// Set the entire attributed string.
    case setAttributedString(NSAttributedString)

    /// Set a certain ``RichTextStyle``.
    case setStyle(RichTextStyle, Bool)

    /// Toggle a certain style.
    case toggleStyle(_ style: RichTextStyle)

    /// Undo the latest change.
    case undoLatestChange
}

public extension RichTextAction {

    typealias Publisher = PassthroughSubject<Self, Never>

    /// The action's unique identifier.
    var id: String { title }

    /// The action's standard icon.
    var icon: Image {
        switch self {
        case .copy: .richTextCopy
        case .deleteSelectedText: .richTextDelete
        case .deleteText: .richTextDelete
        case .pasteText: .richTextDocuments
        case .redoLatestChange: .richTextRedo
        case .replaceSelectedText: .richTextReplace
        case .replaceText: .richTextReplace
        case .selectRange: .richTextSelection
        case .setAttributedString: .richTextDocument
        case .setStyle(let style, _): style.icon
        case .toggleStyle(let val): val.icon
        case .undoLatestChange: .richTextUndo
        }
    }

    /// The localized label to use for the action.
    var label: some View {
        icon.label(title)
    }

    /// The localized title to use in the main menu.
    var menuTitle: String {
        menuTitleKey.text
    }

    /// The localized title key to use in the main menu.
    var menuTitleKey: RTKL10n {
        titleKey
    }

    /// The localized action title.
    var title: String {
        titleKey.text
    }

    /// The localized action title key.
    var titleKey: RTKL10n {
        switch self {
        case .copy: .actionCopy
        case .deleteSelectedText: .actionDelete
        case .deleteText: .actionDelete
        case .pasteText: .pasteText
        case .redoLatestChange: .actionRedoLatestChange
        case .replaceSelectedText: .actionDelete
        case .replaceText: .actionDelete
        case .selectRange: .selectRange
        case .setAttributedString: .setAttributedString
        case .setStyle(let style, _): style.titleKey
        case .toggleStyle(let style): style.titleKey
        case .undoLatestChange: .actionUndoLatestChange
        }
    }
}

// MARK: - Aliases

public extension RichTextAction {

    /// A name alias for `.redoLatestChange`.
    static var redo: RichTextAction { .redoLatestChange }

    /// A name alias for `.undoLatestChange`.
    static var undo: RichTextAction { .undoLatestChange }
}
