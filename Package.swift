// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "printer",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .tvOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "Printer",
            targets: ["Printer"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Printer",
            dependencies: []),
        .testTarget(
            name: "PrinterTests",
            dependencies: ["Printer"]),
    ]
)
