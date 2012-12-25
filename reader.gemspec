# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reader/version'

Gem::Specification.new do |gem|
  gem.name          = "reader"
  gem.version       = Reader::VERSION
  gem.authors       = ["Amr Tamimi"]
  gem.email         = ["amrnt0@gmail.com"]
  gem.description   = %q{A tool to read a link and extracts its data}
  gem.summary       = %q{A tool to read a link and extracts its data}
  gem.homepage      = "http://rubygems.org/gems/reader"

  gem.rubyforge_project = "reader"

  gem.add_runtime_dependency 'nokogiri', '~> 1.5'
  gem.add_runtime_dependency 'faraday', '~> 0.8'
  gem.add_runtime_dependency 'multi_json', '~> 1.5'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 2.12.0'
  gem.add_development_dependency 'bundler'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
