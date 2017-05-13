#
# Be sure to run `pod lib lint NSJTextField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NSJTextField'
  s.version          = '0.1.0'
  s.summary          = 'A custom textfield.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A custom textfield with the placeholder displayed on top when text entered.'

  s.homepage         = 'https://github.com/NSJoker/NSJTextField'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NSJoker' => 'laughofnsjoker@gmail.com' }
  s.source           = { :git => 'https://github.com/NSJoker/NSJTextField.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/chandrachudh'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NSJTextField/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NSJTextField' => ['NSJTextField/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
