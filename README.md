# unicorn-rails

`unicorn-rails` is a simple gem that sets the default server for rack (and rails) to unicorn.

## Description

unicorn-rails overrides the `Rack::Handler.default` method to return `Rack::Handler::Unicorn` which will cause rack (and
rails) to use unicorn by default.

## Installing

### Recommended

```
gem install unicorn-rails
```

### Edge

```
git clone https://github.com/samuelkadolph/unicorn-rails
cd unicorn-rails && rake install
```

## Usage

Add `gem "unicorn-rails"` to your Gemfile and then run `rails s` and it will use unicorn by default.
