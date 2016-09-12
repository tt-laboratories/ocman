$:.push File.expand_path("../lib", __FILE__)
require "ocman/version"

Gem::Specification.new do |s|
  s.name        = 'ocman'
  s.version     = Ocman::VERSION.dup
  s.date        = '2016-09-12'
  s.summary     = "Ocman - Manages files and shares in owncloud"
  s.description = "Ruby gem for file managment and sharing in owncloud"
  s.authors     = ["Waldemar Gribele", "Stefan Rohde"]
  s.email       = 'laboratories@toptranslation.com'
  s.files       = Dir["{lib}/**/*"]
  s.homepage    = 'https://developer.toptranslation.com'
  s.license     = 'MIT'

  s.add_runtime_dependency 'net_dav', '~> 0.5.1'
  s.add_runtime_dependency 'hashie', '~> 3.4'
  s.add_runtime_dependency 'rest-client', '~> 1.8'
  s.add_development_dependency 'rspec', '~> 3.4'

end
