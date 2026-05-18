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
            url: "https://www.peabodycompliance.com/v1.0.5/PeabodySDK.xcframework.zip",
            checksum: "c3e227c6708ec9711497951e1d3e0ec864df1883502bf42227832ea2e4b1b5ae"
        )
    ]
)

