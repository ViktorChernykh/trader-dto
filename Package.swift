// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "trader-dto",
    platforms: [
        .macOS(.v12),
		.iOS(.v13)
    ],
    products: [
        .library(name: "TraderDto", targets: ["TraderDto"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "TraderDto", dependencies: []),
    ]
)
