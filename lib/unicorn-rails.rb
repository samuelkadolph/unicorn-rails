module UnicornRails
  require "unicorn-rails/version"
end

require "unicorn"

module Rack
  module Handler
    class Unicorn
      class << self
        def run(app, options = {})
          unicorn_options = {}
          unicorn_options[:listeners] = ["#{options[:Host]}:#{options[:Port]}"]
          unicorn_options[:worker_processes] = 1

          if options[:debugger]
            unicorn_options[:worker_processes] = 1
            unicorn_options[:timeout] = 120
          end

          ::Unicorn::Launcher.daemonize!(unicorn_options) if options[:daemonize]
          ::Unicorn::HttpServer.new(app, unicorn_options).start.join
        end
      end
    end

    register "unicorn", "Rack::Handler::Unicorn"

    def self.default(options = {})
     Rack::Handler::Unicorn
    end
  end
end
