#
# Be sure to run `pod lib lint SwiftLocaleKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftLocaleKit'
  s.version          = '1.5.1'
  s.summary          = 'The SwiftLocaleKit is libriry for simlify localization and synchronize it with system localization settings and synchronize them'

  s.description      = <<-DESC
The SwiftLocaleKit is libriry for simlify localization and synchronize it with system localization settings and synchronize them.
                       DESC

  s.homepage         = 'https://github.com/FuturraGroup/SwiftLocaleKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kyrylo Mukha' => 'kyrylo.mukha@icloud.com' }
  s.source           = { :git => 'https://github.com/FuturraGroup/SwiftLocaleKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version = "5.5"

  s.source_files = 'Sources/SwiftLocaleKit/**/*.{swift}'
end
