#
#  Be sure to run `pod spec lint UizaSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name          = "UizaSDK"
  s.version       = "7.0"
  s.summary       = "UizaSDK Framework"
  s.description   = "A framework that handles API connect to Uiza system"
  s.homepage      = "https://github.com/uizaio/uiza-sdk-player-ios"

  s.license       = { :type => 'BSD', :file => 'LICENSE' }
  s.author        = { 'Nam Kennic' => 'namkennic@me.com' }
  s.platform      = :ios, "9.0"
  s.platform      = :tvos, "10.0"
  s.requires_arc  = true
  s.swift_version = '4.2'
  s.source        = { :git => "https://github.com/uizaio/uiza-sdk-player-ios.git", :branch => 'origin', :tag => s.version }
  s.documentation_url   = 'https://uizaio.github.io/uiza-sdk-player-ios/'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
  
  s.ios.deployment_target     = '9.0'
  s.ios.vendored_frameworks   = 'UizaSDK.framework'

  s.tvos.deployment_target    = '10.0'
  s.tvos.vendored_frameworks  = 'UizaSDK_tvos.framework'

  s.ios.dependency "Alamofire"
  s.ios.dependency "SwiftyJSON"
  s.ios.dependency "LFLiveKit+"
  s.ios.dependency "FrameLayoutKit"
  s.ios.dependency "NKButton"
  s.ios.dependency "NKModalViewManager"
  s.ios.dependency "SDWebImage"
  s.ios.dependency "GoogleAds-IMA-iOS-SDK"
  s.ios.dependency "google-cast-sdk"
  s.ios.dependency "TweenKit"
  
  s.tvos.dependency "Alamofire"
  s.tvos.dependency "SwiftyJSON"
  
end
