// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Detail",
    platforms: [
        .visionOS(.v26)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Detail",
            targets: ["Detail"]
        ),
    ],
    dependencies: [
        .package(path: "../RealityKitContent"),
        .package(path: "../Common"),
        .package(path: "../Domain"),
        .package(path: "../AppState"),
        .package(path: "../Application")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Detail",
            dependencies: [
                .product(
                    name: "RealityKitContent",
                    package: "RealityKitContent"
                ),
                .product(
                    name: "Common",
                    package: "Common"
                ),
                .product(
                    name: "Domain",
                    package: "Domain"
                ),
                .product(
                    name: "AppState",
                    package: "AppState"
                ),
                .product(
                    name: "Application",
                    package: "Application"
                )
            ]
        ),
        .testTarget(
            name: "DetailTests",
            dependencies: ["Detail"]
        ),
    ]
)
