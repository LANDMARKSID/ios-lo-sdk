# LANDMARKSID LO SDK Swift Example

This repository provides a simple demonstration of how to integrate the LANDMARKSID iOS SDK using Swift.

## Features

This app includes examples on how to:
* Configure the SDK and handle events in `AppDelegate.swift`
* Request tracking permissions (`ViewController.swift`)
* Send custom data (`ViewController.swift`)

## Requirements

* Xcode

## Installation

You can install the LandmarksID SDK using either CocoaPods or Swift Package Manager.

### Option 1: CocoaPods

1. **Install CocoaPods dependencies:**

    ```shell
    pod install
    ```

2. **Open the workspace:**

    Open `lo-example.xcworkspace` in Xcode.

### Option 2: Swift Package Manager

1. **Open the project:**

    Open `lo-example.xcodeproj` in Xcode.

2. **Add Package Dependencies:**

    - Go to `File > Add Package Dependencies`
    - Add the LandmarksID SDK using the binary target approach (see `Package.swift` for reference)

    Alternatively, you can use the included `Package.swift` file as a reference for manual setup.

### Configuration (Both Methods)

1. **Configure secrets:**

    ```shell
    cp Config.xcconfig.example Config.xcconfig
    ```

2. **Add configuration file:**

    Drag and drop `Config.xcconfig` into the `lo-example` project.

3. **Populate configuration file:**

    Fill in `Config.xcconfig` with your LandmarksID SDK credentials, including the App ID and App Secret.

4. **Assign configuration to the app:**

    Go to `Project > lo-example > Info`. Under the Configuration section, select `Config` for both Debug and Release configurations.

By following these steps, you will be able to integrate and configure the LANDMARKSID SDK in your Swift project.