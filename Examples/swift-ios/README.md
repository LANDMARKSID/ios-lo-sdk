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

### Switching Between Dependency Modes

A convenience script is provided to quickly switch the example app between different dependency modes. Run it from the repository root:

```shell
npm run example -- <pods|spm> <local|built|published>
```

| Command | What it does |
|---|---|
| `npm run example -- pods local` | CocoaPods using **source code** from the local repo. Best for active SDK development since changes are picked up immediately. |
| `npm run example -- pods built` | CocoaPods using a **locally-built xcframework**. Builds it via `scripts/build.sh` if not present. Useful for testing the built binary via CocoaPods before publishing. |
| `npm run example -- pods published` | CocoaPods using the **published pod** from the GitHub tag matching the current podspec version. |
| `npm run example -- spm local` | SPM using a **locally-built xcframework**. Builds the xcframework via `scripts/build.sh` if not already present. |
| `npm run example -- spm published` | SPM using the **published xcframework** from the GitHub release matching the current version. |

The script handles everything automatically: updating the Podfile/podspec/Xcode project, running `pod install` or `pod deintegrate`, building the xcframework if needed, and managing `Package.swift`.

> **Note:** Only `pods local` compiles from source code. All other modes (`pods built`, `spm local`, etc.) use a pre-built xcframework binary.

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

## Releasing a New Version

Releases are managed from the repository root using `release-it`.

### Prerequisites

- Node.js + Yarn (`yarn install`)
- Ruby `xcodeproj` gem (installed with CocoaPods)

### Steps

1. **Ensure you're on `master` with a clean working tree.**

2. **Run the release command:**

    ```shell
    npx release-it
    ```

    This will:
    - Prompt you to select the new version (patch/minor/major)
    - Bump the version across all files (`package.json`, podspec, `Package.swift`, `INSTRUCTIONS.md`, source code, example Podfile, Xcode projects)
    - Update the release date in `INSTRUCTIONS.md`
    - Create a commit (`chore(release): <version>`) and git tag
    - Push to GitLab

3. **GitLab CI takes over automatically:**
    - Builds and code-signs the XCFramework
    - Calculates the checksum and updates `Package.swift`
    - Pushes the release to the public GitHub repo
    - Creates a GitHub release with the XCFramework zip attached

To preview without making changes:

```shell
npx release-it --dry-run
```