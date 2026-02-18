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
            targets: ["PeabodySDKTarget"]
        ),
    ],
    targets: [
        // Points to your hosted binary zip and ensures its integrity
        .binaryTarget(
            name: "PeabodySDKTarget",
            url: "https://www.peabodycompliance.com/v1.0.0/PeabodySDK.xcframework.zip",
            checksum: "9051d3eb40a584aaa5b39cedb6575438eaf1452cc11a70fb150bed9636498e44"
        )
    ]
)
