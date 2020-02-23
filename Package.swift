// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TabBar",
    products: [
        .library(
            name: "TabBar",
            targets: ["TabBar"]),
    ],
    targets: [
        .target(
            name: "TabBar",
            dependencies: []),
        .testTarget(
            name: "TabBarTests",
            dependencies: ["TabBar"]),
    ]
)
