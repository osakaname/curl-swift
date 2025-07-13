// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "curl-swift",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "curl-swift",
            targets: ["curl-swift"]
        )
    ],
    dependencies: [],
    targets: [
        .systemLibrary(
            name: "CCurl",
            path: "Sources/CCurl",
            providers: [
                .brew(["curl"]),
                .apt(["libcurl4-openssl-dev"]),
                .yum(["libcurl-devel"])
            ]
        ),
        .target(
            name: "curl-swift",
            dependencies: [
                "CCurl"
            ]
        ),
        .testTarget(name: "curl-swift-tests", dependencies: ["curl-swift"]),
    ]
)
