#
# Be sure to run `pod lib lint Components.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Components'
  s.version          = '0.1.1'
  s.summary          = '自定义的label组件，项目内使用'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
自定义的label组件，项目内使用，远程地址：GitHub地址，本地地址：本地地址
                       DESC
  s.swift_version    = '4.2'
  s.homepage         = 'https://github.com/lhp3851/'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jerry' => 'lhp3851@163.com' }
  s.source           = { :git => 'https://github.com/lhp3851/Components.git', :tag => '0.1.1' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.3'

  s.source_files = 'Components/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Components' => ['Components/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
