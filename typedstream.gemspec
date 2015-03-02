# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'typedstream/version'

Gem::Specification.new do |spec|
  spec.name          = "typedstream"
  spec.version       = Typedstream::VERSION
  spec.authors       = ["Yasuaki Uechi"]
  spec.email         = ["uetchy@randompaper.co"]
  spec.summary       = %q{Parse Apple's typedstream data serialisation format in Ruby}
  spec.description   = %q{Parse Apple's typedstream data serialisation format in Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.4"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry-byebug"
end
