Pod::Spec.new do |s|
  s.name         = 'NSDate-KBSRandom'
  s.version      = '0.1.0'
  s.summary      = 'A simple NSDate category for creating random dates'
  s.homepage     = 'https://github.com/Keithbsmiley/NSDate-KBSRandom'
  s.license      = 'MIT'
  s.author       = { 'Keith Smiley' => 'keithbsmiley@gmail.com' }
  s.source       = { :git => 'https://github.com/Keithbsmiley/NSDate-KBSRandom.git', :tag => s.version.to_s }
  s.source_files = 'NSDate+KBSRandom.{h,m}'
  s.requires_arc = true

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
end
