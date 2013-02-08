require "unicorn"

module Unicorn
  module Rails
    require "unicorn/rails/version"
  end
end

module Rack
  module Handler
    class Unicorn
      class << self
        def run(app, options = {})
          workers = ENV['UNICORN_WORKERS'].to_i
          workers = 1 if workers == 0

          unicorn_options = {}
          unicorn_options[:listeners] = ["#{options[:Host]}:#{options[:Port]}"]
          unicorn_options[:worker_processes] = workers 
          unicorn_options[:timeout] = 31 * 24 * 60 * 60

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
