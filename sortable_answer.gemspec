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

  spec.add_dependency "json", "~> 1.8.2"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "rspec-expectations", "~> 3"
  spec.add_development_dependency "rspec-nc", "~> 0.2"
  spec.add_development_dependency "guard", "~> 2.12"
  spec.add_development_dependency "guard-rspec", "~> 4.5"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "pry-remote", "~> 0.1"
  spec.add_development_dependency "pry-nav", "~> 0.2"
  spec.add_development_dependency 'codeclimate-test-reporter','~> 0.4'
end
