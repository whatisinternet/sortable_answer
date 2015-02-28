# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sortable_answer/version'

Gem::Specification.new do |spec|
  spec.name          = "sortable_answer"
  spec.version       = SortableAnswer::VERSION
  spec.authors       = "Josh Teeter"
  spec.email         = "joshteeter@gmail.com"
  spec.summary       = "Really only useful for the Sortable application"
  spec.description   = "Sortable application"
  spec.homepage      = "http://github.com/whatisinternet/sortable_answer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-expectations"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency 'codeclimate-test-reporter','~> 0.4'
end
