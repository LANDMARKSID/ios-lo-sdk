// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "LandmarksIDSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "LandmarksIDSDK",
            targets: ["LandmarksIDSDK"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "LandmarksIDSDK",
            url: "https://github.com/LANDMARKSID/ios-lo-sdk/releases/download/2.7.0/LandmarksIDSDK.xcframework.zip",
            checksum: "5607125558b4f0bf07de277702d60ab8dc3b2bf207b922db39178c15f30366fe"
        ),
    ]
)