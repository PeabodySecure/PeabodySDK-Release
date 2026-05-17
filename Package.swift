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
            url: "https://www.peabodycompliance.com/v1.0.4/PeabodySDK.xcframework.zip",
            checksum: "f9adaba588ebf19a3c242ac0ddcff803932b0aa263fe64846c017e3b99c180b2"
        )
    ]
)

