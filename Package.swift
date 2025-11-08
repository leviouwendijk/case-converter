// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "case-converter",
    platforms: [
        .macOS(.v13),
        // .iOS(.v15)
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/leviouwendijk/plate.git",
            branch: "master"
        ),
    ],
    targets: [
        .executableTarget(
            name: "casecon",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "plate", package: "plate"),
            ],
            // sources: [
            //     "case-converter"
            // ],
        )
    ]
)
