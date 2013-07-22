# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quarrel/version'

Gem::Specification.new do |spec|
  spec.name          = "quarrel"
  spec.version       = Quarrel::VERSION
  spec.authors       = ["Christian Bradley"]
  spec.email         = ["christianbradley@gmail.com"]
  spec.description   = %q{Simple named parameters for ruby}
  spec.summary       = %q{Simple named parameters for ruby}
  spec.homepage      = "https://github.com/christianbradley/quarrel"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "mocha"
end
