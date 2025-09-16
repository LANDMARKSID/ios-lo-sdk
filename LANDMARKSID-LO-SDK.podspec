Pod::Spec.new do |s|
    s.name = "LANDMARKSID-LO-SDK"
    s.version = "2.7.0"
    s.summary = "LANDMARKS ID is a real world insights platform that helps brands learn more about their customers, locations and competitors"
    s.description = "LANDMARKS ID is a mobile location intelligence platform that provides brands and marketers privacy compliant location data on their customers real world behaviours, brand affinities and purchase intents"
    s.homepage = "https://www.landmarksid.com"
    s.license = {
      :type => 'Copyright',
      :text => <<-LICENSE
      LANDMARKS ID iOS SDK
      Copyright © 2020 LANDMARKS ID. All rights reserved.
      By downloading or using the LANDMARKS ID SDK for iOS, You agree to the LANDMARKS ID Terms and Conditions
      https://www.landmarksid.com/about.html
      and acknowledge that such terms govern your use of and access to the iOS SDK.
      LICENSE
    }
    s.module_name = "LandmarksIDSDK"
    s.author = { "LANDMARKSID" => "https://www.landmarksid.com" }
    s.platform = :ios
    s.source = { :git => 'https://github.com/LANDMARKSID/ios-lo-sdk.git', :tag => s.version.to_s }
    s.requires_arc = true
    s.ios.deployment_target = '15.6'
    s.documentation_url = 'https://docs.landmarksid.com/docs/overview.html'
    s.frameworks = 'CoreLocation', 'CoreTelephony', 'SystemConfiguration', 'Foundation', 'AdSupport', 'UIKit'
    s.weak_framework = 'AppTrackingTransparency'

    # Production Build
    s.vendored_frameworks = "LandmarksIDSDK.xcframework"

    # Local development
    #s.source_files = "LandmarksIDSDK/**/*.{h,m}"
    #s.public_header_files = "LandmarksIDSDK/**/*.h"
  end