// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "TweetParser",
    products: [
            .executable(name: "tweetparser", targets: ["twitterParser"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "0.3.0")),
    ],
    targets: [
        .target(
            name: "twitterParser",
            dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")]),
        .testTarget(
            name: "twitterParserTests",
            dependencies: ["twitterParser"]),
    ]
)
