Pod::Spec.new do |s|
  s.name = 'LocalizedTimeAgo'
  s.version = '1.3.0'
  s.license = 'MIT'
  s.summary = 'Swift time ago framework localized in 42 languages.'
  s.homepage = 'https://github.com/toddkramer/LocalizedTimeAgo'
  s.author = 'Todd Kramer'
  s.source = { :git => 'https://github.com/toddkramer/LocalizedTimeAgo.git', :tag => s.version }
  s.swift_versions = ['5.1']

  s.module_name = 'LocalizedTimeAgo'
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files    = 'Sources/LocalizedTimeAgo/*.swift'
  s.resource_bundle = { 'LocalizedTimeAgo' => ['Sources/LocalizedTimeAgo/Resources/*.lproj'] }
end

