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
            url: "https://github.com/LANDMARKSID/ios-lo-sdk/releases/download/3.0.0/LandmarksIDSDK.xcframework.zip",
            checksum: "57a4acd31f2361958175e0784558e96a0ae933230b1fc50136a1ace3062d5db5"
        ),
    ]
)