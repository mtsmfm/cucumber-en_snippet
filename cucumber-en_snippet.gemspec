# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cucumber/en_snippet/version'

Gem::Specification.new do |spec|
  spec.name          = "cucumber-en_snippet"
  spec.version       = Cucumber::EnSnippet::VERSION
  spec.authors       = ["Fumiaki MATSUSHIMA"]
  spec.email         = ["mtsmfm@gmail.com"]
  spec.description   = "Output cucumber step definition snippets in English regardless of a language header"
  spec.summary       = "Output cucumber snippets in English"
  spec.homepage      = "https://github.com/mtsmfm/cucumber-en_snippet"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'cucumber'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "pry"
end
