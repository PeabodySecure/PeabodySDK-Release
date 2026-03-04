// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "PeabodySDK",
    platforms: [
        .iOS(.v15) // Sets the minimum iOS version for customers
    ],
    products: [
        // This is the library name the customer selects in Xcode
        .library(
            name: "PeabodySDK",
            targets: ["PeabodySDK"]
        ),
    ],
    targets: [
        // Points to your hosted binary zip and ensures its integrity
        .binaryTarget(
            name: "PeabodySDK",
            url: "https://www.peabodycompliance.com/v1.0.3/PeabodySDK.xcframework.zip",
            checksum: "2bbcb76efe5b16d5ec6213033c720fa60c659310831f85e98acd7996681419ab"
        )
    ]
)

