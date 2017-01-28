$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fias/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fias_rails"
  s.version     = Fias::VERSION
  s.authors     = ["Andrey Molchanov", "Andrey Perepelkin"]
  s.email       = ["neodelf@gmail.com"]
  s.summary     = "Work with DB FIAS"
  s.description = "Work with DB FIAS"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.7"

  s.add_dependency 'pg'
  s.add_dependency 'nokogiri'
  s.add_dependency 'activerecord-import'
end
