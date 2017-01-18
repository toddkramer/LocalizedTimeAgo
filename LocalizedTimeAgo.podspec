Pod::Spec.new do |s|
  s.name = 'LocalizedTimeAgo'
  s.version = '1.0.2'
  s.license = 'MIT'
  s.summary = 'Swift time ago framework localized in 42 languages.'
  s.homepage = 'https://github.com/toddkramer/LocalizedTimeAgo'
  s.social_media_url = 'http://twitter.com/_toddkramer'
  s.author = 'Todd Kramer'
  s.source = { :git => 'https://github.com/toddkramer/LocalizedTimeAgo.git', :tag => s.version }

  s.module_name = 'LocalizedTimeAgo'
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'Sources/*.swift'
  s.resources    = 'Resources/LocalizedTimeAgo.bundle'
end

