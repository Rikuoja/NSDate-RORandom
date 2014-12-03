Pod::Spec.new do |s|
  s.name         = 'NSDate-RORandom'
  s.version      = '0.2.0'
  s.summary      = 'A simple NSDate category for creating random dates'
  s.homepage     = 'https://github.com/Rikuoja/NSDate-RORandom'
  s.license      = 'MIT'
  s.author       = { 'Riku Oja' => 'riku.oja@kapsi.fi' }
  s.source       = { :git => 'https://github.com/Rikuoja/NSDate-RORandom.git', :tag => s.version.to_s }
  s.source_files = 'NSDate+RORandom.{h,m}'
  s.requires_arc = true

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
end
