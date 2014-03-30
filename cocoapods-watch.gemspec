# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods_watch.rb'

Gem::Specification.new do |spec|
  spec.name          = "cocoapods-watch"
  spec.version       = CocoaPodsWatch::VERSION
  spec.authors       = ["Marin Usalj"]
  spec.summary       = %q{CocoaPods plugin that watches your Podfile and installs pods}
  spec.homepage      = "https://github.com/supermarin/cocoapods-watch"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "listen", "~> 2.7.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

