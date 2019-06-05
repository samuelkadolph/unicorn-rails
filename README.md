[![Gem Version](https://badge.fury.io/rb/unicorn-rails.png)](http://badge.fury.io/rb/unicorn-rails)
[![Dependency Status](https://gemnasium.com/samuelkadolph/unicorn-rails.png)](https://gemnasium.com/samuelkadolph/unicorn-rails)
[![Code Climate](https://codeclimate.com/github/samuelkadolph/unicorn-rails.png)](https://codeclimate.com/github/samuelkadolph/unicorn-rails)

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

### Optional Environment Variables

`UNICORN_WORKERS` -> set the amout of instances you like to start. Default: 1

## Contributing

Fork, branch & pull request.
