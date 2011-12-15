require File.expand_path("../.gemspec", __FILE__)
require File.expand_path("../lib/unicorn-rails/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "unicorn-rails"
  s.version     = UnicornRails::VERSION
  s.authors     = ["Samuel Kadolph"]
  s.email       = ["samuel@kadolph.com"]
  s.homepage    = "https://github.com/samuelkadolph/unicorn-rails"
  s.summary     = readme.summary
  s.description = readme.description

  s.required_ruby_version = ">= 1.8.7"

  s.files = Dir["lib/**/*", "LICENSE", "README.md"]

  s.add_dependency "rack"
  s.add_dependency "unicorn"
end
