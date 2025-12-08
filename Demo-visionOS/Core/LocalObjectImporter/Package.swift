// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocalObjectImporter",
    platforms: [
        .visionOS(.v26)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LocalObjectImporter",
            targets: ["LocalObjectImporter"]
        ),
    ],
    dependencies: [
        .package(path: "../Domain")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LocalObjectImporter",
            dependencies: [
                .product(
                    name: "Domain",
                    package: "Domain"
                )
            ],
            resources: [
                // Bundle static JSON data used by the importer.
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "LocalObjectImporterTests",
            dependencies: ["LocalObjectImporter"]
        ),
    ]
)
