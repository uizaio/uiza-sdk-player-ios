Pod::Spec.new do |s|

  s.name          = "UizaSDKiOS8Swift4"
  s.version       = "7.5.0"
  s.summary       = "UizaSDKiOS8Swift4 Framework"
  s.description   = "A framework that handles API connect to Uiza system"
  s.homepage      = "https://github.com/uizaio/uiza-sdk-player-ios"

  s.license       = { :type => 'BSD', :file => 'LICENSE' }
  s.author        = { 'Nam Kennic' => 'namkennic@me.com' }
  s.platform      = :ios, "8.0"
  s.requires_arc  = true
  s.swift_version = '4.0'
  s.source        = { :git => "https://github.com/uizaio/uiza-sdk-player-ios.git", :branch => 'master', :tag => s.version }
  s.documentation_url   = 'https://uizaio.github.io/uiza-sdk-player-ios/'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  
  s.ios.deployment_target     = '8.0'
  s.ios.vendored_frameworks   = 'UizaSDKiOS8Swift4.framework'

  s.ios.dependency "Alamofire"
  s.ios.dependency "SwiftyJSON"
  s.ios.dependency "LFLiveKit+"
  s.ios.dependency "NKModalViewManager"
  s.ios.dependency "NKButton"
  s.ios.dependency "FrameLayoutKit"
  s.ios.dependency "NVActivityIndicatorView/AppExtension"
  s.ios.dependency "SDWebImage"
  s.ios.dependency "GoogleAds-IMA-iOS-SDK"
  s.ios.dependency "Sentry"
  
end