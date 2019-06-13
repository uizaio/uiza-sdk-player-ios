Pod::Spec.new do |s|

  s.name          = "UizaSDK"
  s.version       = "7.6.2"
  s.summary       = "UizaSDK Framework"
  s.description   = "A framework that handles API connect to Uiza system"
  s.homepage      = "https://github.com/uizaio/uiza-sdk-player-ios"

  s.license       = { :type => 'BSD', :file => 'LICENSE' }
  s.author        = { 'Nam Kennic' => 'namkennic@me.com' }
  s.platform      = :ios, "9.0"
#  s.platform      = :tvos, "10.0"
  s.requires_arc  = true
  s.swift_version = '5.0'
  s.source        = { :git => "https://github.com/uizaio/uiza-sdk-player-ios.git", :branch => 'master', :tag => s.version }
  s.documentation_url   = 'https://uizaio.github.io/uiza-sdk-player-ios/'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  
  s.ios.deployment_target     = '9.0'
  s.ios.vendored_frameworks   = 'UizaSDK.framework'

#  s.tvos.deployment_target    = '10.0'
#  s.tvos.vendored_frameworks  = 'UizaSDK_tvos.framework'

  s.ios.dependency "AFNetworking"
  s.ios.dependency "SwiftyJSON"
  s.ios.dependency "LFLiveKit_"
  s.ios.dependency "NKModalViewManager"
  s.ios.dependency "NKButton"
  s.ios.dependency "FrameLayoutKit"
  s.ios.dependency "NVActivityIndicatorView/AppExtension"
  s.ios.dependency "SDWebImage"
  s.ios.dependency "Sentry"
  
#  s.tvos.dependency "AFNetworking"
#  s.tvos.dependency "SwiftyJSON"
#  s.tvos.dependency "Sentry"
  
end
