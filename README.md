# unicorn-rails

unicorn-rails is a simple gem that sets the default server for rack (and rails) to [unicorn](http://unicorn.bogomips.org/).

## Description

unicorn-rails overrides the `Rack::Handler.default` method to return `Rack::Handler::Unicorn` which will cause rack (and
rails) to use unicorn by default.

## Installation

Add this line to your application's `Gemfile`:

    gem "unicorn-rails"

And then execute:

    $ bundle install

## Usage

Just add the gem to your `Gemfile` and then `rails server` will default to using unicorn.

## Contributing

Fork, branch & pull request.
