#
# Be sure to run `pod lib lint BuAd.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BuAd'
  s.version          = '1.0'
  s.summary          = '头条广告'
  s.description      = "头条广告集成"
  s.homepage         = 'https://github.com/chenqg365/BuAd'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chenqg' => 'chenqg3721@163.com' }
  s.source           = { :git => 'https://github.com/chenqg365/BuAd.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'BuAd/Classes/**/*'
  s.vendored_frameworks = 'BuAd/BUAdSDK.framework'
  s.resources = ['BuAd/*.{bundle}']
  s.ios.frameworks = 'StoreKit', 'MobileCoreServices', 'WebKit', 'MediaPlayer', 'CoreMedia', 'CoreLocation', 'CoreTelephony', 'AVFoundation', 'SystemConfiguration', 'AdSupport', 'CoreMotion', 'Accelerate'
  
  s.ios.libraries = "resolv.9","c++","z","sqlite3"
  
end
