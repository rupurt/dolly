# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dolly/version'

Gem::Specification.new do |spec|
  spec.name          = "dolly"
  spec.version       = Dolly::VERSION
  spec.authors       = ["Alex Kwiatkowski"]
  spec.email         = ["alex+git@rival-studios.com"]
  spec.description   = %q{Dolly allows you to run rake tasks in isolation. For instance you
                          could run your test in isolation while continuing to work in your current directory}
  spec.summary       = %q{Dolly allows you to run rake tasks in isolation.}
  spec.homepage      = "http://github.com/rupurt/dolly"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 4.0.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "fuubar"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
