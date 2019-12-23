#
# Be sure to run `pod lib lint KTMapSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KTMapSDK'
  s.version          = '0.1.6'
  s.summary          = 'A short description of KTMapSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/huangzhentong/KTMapSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '181310067@qq.com' => 'huangzhentong@keytop.com.cn' }
  s.source           = { :git => 'https://github.com/huangzhentong/KTMapSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KTMapSDK/Classes/**'
  s.resource = 'KTMapSDK/Assets/*'
  # s.resource_bundles = {
  #   'KTMapSDK' => ['KTMapSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'WebKit','Foundation','CoreLocation'
s.dependency 'AMapNavi'
s.dependency 'DMapFramework'
s.dependency  'Masonry'
s.dependency 'IQKeyboardManager'
s.dependency'AFNetworking'
s.dependency 'SVProgressHUD'
s.dependency 'HTCKeyboard'

s.vendored_frameworks = 'KTMapSDK/Classes/KTMapFrameWork.framework'
end
