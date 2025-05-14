// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "JournalSentiment",
    platforms: [
        .macOS(.v12),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "JournalSentiment",
            targets: ["JournalSentiment"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "JournalSentiment",
            dependencies: [],
            path: "Sources/JournalSentiment",
            resources: [
                .process("Resources/sentiment_feedback.json")
            ]
        ),
        .testTarget(
            name: "JournalSentimentTests",
            dependencies: ["JournalSentiment"],
            path: "Tests/JournalSentimentTests"
        ),
        .executableTarget(
            name: "Example",
            dependencies: ["JournalSentiment"],
            path: "Sources/Example"
        )
    ]
) 