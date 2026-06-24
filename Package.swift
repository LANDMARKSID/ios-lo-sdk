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
            url: "https://github.com/LANDMARKSID/ios-lo-sdk/releases/download/3.0.0/LandmarksIDSDK.xcframework.zip",
            checksum: "1666b60a9a93474ab0e6e5b44cce6713ade1d551bea5daab4d6f4ffbed1ba07b"
        ),
    ]
)