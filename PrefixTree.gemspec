# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'PrefixTree/version'

Gem::Specification.new do |spec|
  spec.name          = "PrefixTree"
  spec.version       = PrefixTree::VERSION
  spec.authors       = ["Pavel Gladko"]
  spec.email         = ["pol_g@mail.ru"]
  spec.summary       = %q{Prefix tree realization.}
  spec.description   = %q{Prefix tree realization.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
