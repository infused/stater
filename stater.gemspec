lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'stater/version'

Gem::Specification.new do |s|
  s.name = 'stater'
  s.version = Stater::VERSION
  s.authors = ['Keith Morrison']
  s.email = 'keithm@infused.org'
  s.homepage = 'http://github.com/infused/stater'
  s.summary = 'Time Value of Money calulations'
  s.description = 'Time Value of Money calulations'
  
  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = ['README.md', 'MIT-LICENSE']
  s.files = Dir['[A-Z]*', '{doc,lib,spec}/**/*']
  s.test_files = Dir.glob('spec/**/*_spec.rb')
  s.require_paths = ['lib']

  s.required_rubygems_version = '>= 1.8.0'
  s.add_development_dependency 'rake', '~> 0.9.2'
  s.add_development_dependency 'rspec', '~> 2.11.0'
  s.add_development_dependency 'nokogiri', '~> 1.5.0'
end

