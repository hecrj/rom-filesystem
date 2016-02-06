# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rom/filesystem/version'

Gem::Specification.new do |spec|
  spec.name          = 'rom-filesystem'
  spec.version       = Rom::Filesystem::VERSION
  spec.authors       = ['Héctor Ramón']
  spec.email         = ['hector0193@gmail.com']

  spec.summary       = 'Filesystem adapter for ROM'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/hecrj/rom-filesystem'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rom', '~> 1.0.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
end
