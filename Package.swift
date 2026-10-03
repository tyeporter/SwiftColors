// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftColors",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v9),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "SwiftColors",
            targets: ["SwiftColors"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftColors",
        )
    ]
)
