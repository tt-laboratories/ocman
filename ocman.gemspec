Gem::Specification.new do |s|
  s.name        = 'ocman'
  s.version     = '0.0.0'
  s.date        = '2016-06-10'
  s.summary     = "Ocman - Manages files and shares in owncloud"
  s.description = "Ruby gem for file managment and sharing in owncloud"
  s.authors     = ["Waldemar Gribele", "Stefan Rohde"]
  s.email       = 'laboratories@toptranslation.com'
  s.files       = Dir["{lib}/**/*"]
  s.homepage    = 'https://developer.toptranslation.com'
  s.license     = 'MIT'

  s.add_runtime_dependency 'net_dav', '~> 0'
end
