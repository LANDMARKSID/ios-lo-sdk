// swift-tools-version:5.5
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
            url: "https://github.com/LANDMARKSID/ios-lo-sdk/releases/download/3.0.1/LandmarksIDSDK.xcframework.zip",
            checksum: "ea171b036cd787a5254320ff997686102b6c931413fe6b60afb1576368a1228d"
        ),
    ]
)