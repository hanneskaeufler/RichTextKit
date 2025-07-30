//
//  DemoDocument.swift
//  Demo
//
//  Created by Daniel Saidi on 2024-03-04.
//  Copyright © 2024 Kankoda Sweden AB. All rights reserved.
//

import SwiftUI
import RichTextKit
import UniformTypeIdentifiers

struct DemoDocument: FileDocument {

    init(text: NSAttributedString = .empty) {
        self.text = text
    }

    var text: NSAttributedString

    static var readableContentTypes: [UTType] { [] }

    init(
        configuration: ReadConfiguration
    ) throws {
        guard
            let data = configuration.file.regularFileContents
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        self.text = NSAttributedString()
    }

    func fileWrapper(
        configuration: WriteConfiguration
    ) throws -> FileWrapper {
        return .init(regularFileWithContents: Data())
    }
}
