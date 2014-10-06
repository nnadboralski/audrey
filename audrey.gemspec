$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "audrey/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "audrey"
  s.version     = Audrey::VERSION
  s.authors     = ["Nick Nadboralski"]
  s.email       = ["nick@u4g.com"]
  s.homepage    = ""
  s.summary     = "Consumes user feedback"
  s.description = "A mountable rails application to consume user feedback"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.6"

  s.add_development_dependency "pg"
end
