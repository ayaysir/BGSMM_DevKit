#
# Be sure to run `pod lib lint BGSMM_DevKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BGSMM_DevKit'
  s.version          = '1.0.1'
  s.summary          = 'BGSMM_DevKit is a collection of various utilities that I will use when developing.'

  # Set swift version
  s.swift_version    = '5.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
BGSMM_DevKit is a collection of various utilities that I will use when developing.
Include SimpleAlert, StringManipulator, and etc..
                       DESC

  # s.homepage         = 'https://github.com/40187546/BGSMM_DevKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  # s.source           = { :git => 'https://github.com/40187546/BGSMM_DevKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.homepage         = 'https://github.com/ayaysir/BGSMM_DevKit'
  s.source           = { :git => 'https://github.com/ayaysir/BGSMM_DevKit.git', :tag => s.version.to_s }	
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '40187546' => 'yoonbumtae@gmail.com' }
  
  # Localization
  s.resource_bundles = {
    'BGSMM_DevKit' => ['Sources/BGSMM_DevKit/Resources/*.lproj']
  }

  s.ios.deployment_target = '10.0'

  # 여기 변경 (소스 위치)
  s.source_files = 'Sources/BGSMM_DevKit/**/*'
  
  # s.resource_bundles = {
  #   'BGSMM_DevKit' => ['BGSMM_DevKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
