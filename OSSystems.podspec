#
# Be sure to run `pod lib lint OSSystems.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "OSSystems"
  s.version          = "0.8.2"
  s.summary          = "None"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                        Description
                       DESC

  s.homepage         = "https://github.com/oSolve/OSSystems"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "TC94615" => "tclee0117@gmail.com" }
  s.source           = { :git => "https://github.com/oSolve/OSSystems.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  # s.resource_bundles = {
  #   'OSSystems' => ['Pod/Assets/*.png']
  # }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.dependency 'UICKeyChainStore', '~> 2.1.0'
end
