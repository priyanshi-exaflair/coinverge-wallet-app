require 'json'

package = JSON.parse(File.read(File.join(__dir__, '../package.json')))

Pod::Spec.new do |s|
  s.name         = 'Didcomm'
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']
  s.authors      = package['author']
  s.homepage     = 'https://github.com'
  s.platform     = :ios, "13.0"
  s.source       = { :path => "." }
  s.source_files = "**/*.{h,m,mm}"
  
  # Conditionally include the library - exclude for simulator builds
  # The library is built for macOS, so it won't work on iOS Simulator
  # Code uses TARGET_IPHONE_SIMULATOR to conditionally compile
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS[sdk=iphoneos*]' => '$(inherited) -L"${PODS_TARGET_SRCROOT}" -ldidcomm_sdk',
    'LIBRARY_SEARCH_PATHS[sdk=iphoneos*]' => '$(inherited) "${PODS_TARGET_SRCROOT}"',
  }
  
  # Only preserve the library file, but don't auto-link it
  s.preserve_paths = "**/*"
  s.dependency "React-Core"
end