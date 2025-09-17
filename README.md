---
id: iOS_LO
title: LO - iOS SDK
---
## V 3.0.0 (released 16-09-2025)

## Support
- The LANDMARKS ID SDK supports iOS 15.6 and above.

## Setup Instructions

### Using CocoaPods
1. If you previously included the SDK manually please delete both `LandmarksIDSDK.framework` from the project.
2. Include the LandmarksID pod in the Podfile.

```ruby
pod 'LANDMARKSID-LO-SDK', :git => 'https://github.com/LANDMARKSID/ios-lo-sdk.git', :tag => '3.0.0'
```
3. Run `pod install`.

An example application is available in the Examples folder of the [GitHub repository](https://github.com/LANDMARKSID/ios-lo-sdk).


### Local Installation (Manual Download)

1. Go to the [GitHub releases page](https://github.com/LANDMARKSID/ios-lo-sdk/releases) and download the latest `LandmarksIDSDK.xcframework.zip` file.
2. Extract the zip file to get `LandmarksIDSDK.xcframework`.
3. In Xcode, open your project and navigate to your app target.
4. Go to **Project Navigator** → Select your project → Select your target → **General** tab.
5. Under **Frameworks, Libraries, and Embedded Content**, click the **+** button.
6. Click **Add Other...** → **Add Files...** and select the extracted `LandmarksIDSDK.xcframework`.
7. Ensure the framework is set to **"Embed & Sign"**.

### Swift Package Manager (SPM)

#### Option 1: Using Xcode Package Manager

1. In Xcode, open your project and go to **File** → **Add Package Dependencies**.
2. Enter the following repository URL:
   ```
   https://github.com/LANDMARKSID/ios-lo-sdk.git
   ```
3. Select the latest version available (3.0.0).
4. Click **Add Package** and wait for Xcode to resolve the dependency.
5. Select **LandmarksIDiOS** from the list and click **Add Package**.

**iOS Configuration Information**

**Required background updates description**

Set the appropriate usage description in the application's `info.plist` when using Location services:

1. Locate the app's `info.plist` file in the Supporting Files folder of the Xcode project.
2. For location permission request and description:
3. Add `Privacy - Location When In Use Usage Description` with an appropriate description.

**Edit the AppDelegate**

1. Import the LandmarksID SDK into `AppDelegate.swift`:
    ```swift
    import LandmarksIDSDK
    ```

2. Add `landmarksIdManager` as a property in the `AppDelegate`:
    ```swift
    var landmarksIdManager: LandmarksIDManagerDelegate?
    ```

3. Add the following snippets to the app delegate functions. 

    `application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool`:
    ```swift
    let appId = "APP_ID"
    let appSecret = "APP_SECRET"
    
    self.landmarksIdManager = LandmarksIDManagerDelegate.initialize(appId, appSecret: appSecret)
    
    landmarksIdManager?.setup()
    ```

    `applicationDidBecomeActive(_ application: UIApplication)`:
    ```swift
    DispatchQueue.global(qos: .utility).async {
        self.landmarksIDManager?.startTracking()
    }
    ```

    `applicationDidEnterBackground(_ application: UIApplication)`:
    ```swift
    DispatchQueue.global(qos: .utility).async {
        self.landmarksIDManager?.stopTracking()
    }
    ```

    `applicationWillTerminate(_ application: UIApplication)`:
    ```swift
    DispatchQueue.global(qos: .utility).async {
        LandmarksIDManagerDelegate.sharedManager()?.applicationWillTerminate()
    }
    ```

**HINT**: Store your secrets safely, like in an `.xcconfig` file, to avoid committing them to the code.

## Additional Controls

**Controlling Location Manager Access**

To avoid initiating unwanted location permission prompts, set `allowLocationPermissionsRequest` to `true` after the application has used the location manager for the first time, or when the application wants the Landmarks ID SDK to handle location permission requests:

```swift
LandmarksIDManagerDelegate.sharedManager()?.requestLocationPermissions(.authorizedWhenInUse)
```

**Controlling User Data Collection**

These functions help manage device-level data collection. By default, data collection is allowed (`true`).

- Check if data collection is allowed:
    ```swift
    LandmarksIDManagerDelegate.sharedManager().isAllowedToRecordData()
    ```

- Stop recording data:
    ```swift
    LandmarksIDManagerDelegate.sharedManager().stopRecordingData()
    ```

- Restart recording data:
    ```swift
    LandmarksIDManagerDelegate.sharedManager().restartRecordingData()
    ```

### Sending Additional Data

Attach custom values to the Landmarks ID SDK session, which will be recorded with each location event. Multiple custom values can be passed into each function.

**Standardized Functions for Specific User Data**

- Set Client's Customer ID:
    ```swift
    LandmarksIDManagerDelegate.sharedManager().customerId = "CUSTOMER_ID"
    ```

**Custom Functions for Other User Data**

- Set an integer value:
    ```swift
    LandmarksIDManagerDelegate.sharedManager().setCustomInt("rank", value: 12)
    ```

- Set a float value:
    ```swift
    LandmarksIDManagerDelegate.sharedManager().setCustomFloat("score", value: 23.29)
    ```

- Set a string value:
    ```swift
    LandmarksIDManagerDelegate.sharedManager().setCustomString("mobile", value: "123134323432")
    ```

## Contact Details

For further questions, please contact our team at:

developers@landmarksid.com