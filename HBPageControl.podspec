#
# Be sure to run `pod lib lint HBPageControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HBPageControl'
  s.version          = '0.1.0'
  s.summary          = 'A PageControl For iOS After iOS14 , you can set width,height,spacing,color'
  s.swift_versions = '5.0'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  一个PageControl用以适配iOS14后的修改，支持自定义宽度、长度、间距、颜色等等属性，实现起来也很简单，提供一种思路给大家，以供不同的业务需求。
                       DESC

  s.homepage         = 'https://github.com/GitHubYhb/HBPageControl'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'GitHubYhb' => '412625278@qq.com' }
  s.source           = { :git => 'https://github.com/GitHubYhb/HBPageControl.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'HBPageControl/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HBPageControl' => ['HBPageControl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
