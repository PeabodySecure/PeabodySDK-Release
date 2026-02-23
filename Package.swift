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
            url: "https://www.peabodycompliance.com/v1.0.1/PeabodySDK.xcframework.zip",
            checksum: "e643689421d37fd026c00f5147ad8244a903642c0e3bba6ced99bb7ba1bf5e8d"
        )
    ]
)

