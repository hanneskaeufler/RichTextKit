// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "RichTextKit",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "RichTextKit",
            targets: ["RichTextKit"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/danielsaidi/MockingKit.git",
            .upToNextMajor(from: "1.5.0")
        )
    ],
    targets: [
        .target(
            name: "RichTextKit",
            dependencies: [],
            resources: [.process("Resources")],
            swiftSettings: [
                .define("macOS", .when(platforms: [.macOS])),
            ]
        ),
        .testTarget(
            name: "RichTextKitTests",
            dependencies: ["RichTextKit", "MockingKit"],
            swiftSettings: [
                .define("macOS", .when(platforms: [.macOS])),
            ]
        )
    ]
)
