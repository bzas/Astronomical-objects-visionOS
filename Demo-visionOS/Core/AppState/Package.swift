// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppState",
    platforms: [
        .visionOS(.v26)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AppState",
            targets: ["AppState"]
        ),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../Application")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AppState",
            dependencies: [

                .product(
                    name: "Domain",
                    package: "Domain"
                ),
                .product(
                    name: "Application",
                    package: "Application"
                )
            ]
        ),
        .testTarget(
            name: "AppStateTests",
            dependencies: ["AppState"]
        ),
    ]
)
