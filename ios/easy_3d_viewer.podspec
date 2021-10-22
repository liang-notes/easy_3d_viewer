#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint easy_3d_viewer.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'easy_3d_viewer'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter project.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*','Frameworks/3DViewer/include/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  # s.ios.vendored_frameworks = 'Frameworks/3DViewer/libiGolfViewer3D.a', 'Frameworks/3DViewer/*'
  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lz -lc++ -lObjC' }
  s.vendored_libraries = 'Frameworks/3DViewer/libiGolfViewer3D.a'
  s.public_header_files = 'Frameworks/3DViewer/include/*.h'
  s.ios.resources = ['Frameworks/3DViewer/textures/*']
  s.swift_version = '5.0'
  s.static_framework = true 
end
