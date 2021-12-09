#
# Be sure to run `pod lib lint LYZNetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LYZNetworking'
  s.version          = '0.0.9'
  s.summary          = 'LYZNetworking 是一款简单易用的网络框架, 支持 get, post, 配置简单, 稳定可靠.关注后请 star'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/liuyaozong1/LYZ_Networking'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '648731281@qq.com' => '648731281@qq.com' }
  s.source           = { :git => 'https://github.com/liuyaozong1/LYZ_Networking.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'LYZNetworking/Classes/**/*'
  
  s.swift_version = '5.0'
  
  s.platform =  :ios,'11.0'
  
  # s.resource_bundles = {
  #   'LYZNetworking' => ['LYZNetworking/Assets/*.png']
  # }
#  /Users/liuyaozong/LYZNetworkingSpec/LYZ_Networking/LYZNetworking/Classes/LYZApiModel.swift

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
