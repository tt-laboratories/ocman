# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'ocman/version'

Gem::Specification.new do |s|
  s.name        = 'ocman'
  s.version     = Ocman::VERSION.dup
  s.date        = '2016-12-30'
  s.summary     = 'Ocman - Manages files and shares in nextcloud/owncloud'
  s.description = 'Ruby gem for file managment and sharing in nextcloud/owncloud'
  s.authors     = ['Waldemar Gribele', 'Stefan Rohde']
  s.email       = 'laboratories@toptranslation.com'
  s.files       = Dir['{lib}/**/*']
  s.homepage    = 'https://developer.toptranslation.com'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 2.4'

  s.add_runtime_dependency 'hashie', '~> 3.4'
  s.add_runtime_dependency 'multi_json', '~> 1.0'
  s.add_runtime_dependency 'net_dav', '~> 0.5.1'
  s.add_runtime_dependency 'rest-client', '~> 2.0'

  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-nav'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 3.5'
  s.add_development_dependency 'rubocop', '~> 1.6.1'
  s.add_development_dependency 'rubocop-rake', '~> 0.5'
  s.add_development_dependency 'rubocop-rspec', '~> 2.1.0'
end
