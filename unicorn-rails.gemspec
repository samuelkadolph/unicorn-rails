require File.expand_path("../.gemspec", __FILE__)
require File.expand_path("../lib/unicorn_rails/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "unicorn-rails"
  gem.authors     = ["Samuel Kadolph"]
  gem.email       = ["samuel@kadolph.com"]
  gem.description = readme.description
  gem.summary     = readme.summary
  gem.homepage    = "https://github.com/samuelkadolph/unicorn-rails"
  gem.version     = UnicornRails::VERSION

  gem.files       = Dir["lib/**/*"]

  gem.required_ruby_version = ">= 1.8.7"

  gem.add_dependency "rack"
  gem.add_dependency "unicorn"
end
