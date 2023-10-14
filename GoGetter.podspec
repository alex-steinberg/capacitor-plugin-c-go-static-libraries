require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))
workspace = 'Plugin'

Pod::Spec.new do |s|
    s.name = 'GoGetter'
    s.version = package['version']
    s.summary = package['description']
    s.license = package['license']
    s.homepage = package['repository']['url']
    s.author = package['author']
    s.source = { :git => package['repository']['url'], :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '13.0'
    s.dependency 'Capacitor'
    s.swift_version = '5.1'
    s.subspec 'golib' do |sg|
        sg.preserve_paths = 'ios/Plugin/golib/libgolib.h'
        sg.source_files = 'ios/Plugin/golib/libgolib.a'
        sg.public_header_files = 'ios/Plugin/golib/libgolib.h'
        sg.vendored_library = 'ios/Plugin/golib/libgolib.a'
    end
end
