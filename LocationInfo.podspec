#
# Be sure to run `pod lib lint LocationInfo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LocationInfo'
  s.version          = '1.0.3'
  s.summary          = 'It provides a common interface to location info for geocoding'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This LocationInfo interconnects different frameworks : image metadata processing, geocoding, speech recognition, etc. This used like shared data object amoung them all.
                       DESC

  s.homepage         = 'https://github.com/truebucha/LocationInfo'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'truebucha' => 'truebucha@gmail.com' }
  s.source           = { :git => 'https://github.com/truebucha/LocationInfo.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/truebucha'

    s.ios.deployment_target = '9.0'
    s.osx.deployment_target = '10.10'
    s.requires_arc = true

    s.public_header_files = 'LocationInfo/Classes/LocationInfo.h'
    s.source_files = 'LocationInfo/Classes/*.{h,m}'
    s.default_subspec = 'Core'
    s.frameworks = 'Foundation'

    s.subspec 'Core' do |sp|
        sp.source_files = 'LocationInfo/Classes/Core/**/*'
        sp.public_header_files = 'LocationInfo/Classes/Core/*.h'
    end

    s.subspec 'LMGeocoder' do |sp|
        sp.source_files = 'LocationInfo/Classes/LMGeocoder/**/*'
        sp.public_header_files = 'LocationInfo/Classes/LMGeocoder/*.h'
        sp.dependency 'LocationInfo/Core'
        sp.dependency 'LMGeocoderUniversal'
    end

    s.subspec 'AppleGeocoder' do |sp|
        sp.source_files = 'LocationInfo/Classes/AppleGeocoder/**/*'
        sp.public_header_files = 'LocationInfo/Classes/AppleGeocoder/*.h'
        sp.dependency 'LocationInfo/Core'
        sp.frameworks = 'CoreLocation'
    end

    s.subspec 'AppleMap' do |sp|
        sp.source_files = 'LocationInfo/Classes/AppleMap/**/*'
        sp.public_header_files = 'LocationInfo/Classes/AppleMap/*.h'
        sp.dependency 'LocationInfo/Core'
        sp.dependency 'LocationInfo/AppleGeocoder'
        sp.frameworks = 'MapKit'
    end
end
