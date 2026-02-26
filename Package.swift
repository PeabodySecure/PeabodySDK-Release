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
            url: "https://www.peabodycompliance.com/v1.0.2/PeabodySDK.xcframework.zip",
            checksum: "6595d4cb3d80b0d0d112876214348cbe98868e37ae6618c6ec086e05aee7dee4"
        )
    ]
)

