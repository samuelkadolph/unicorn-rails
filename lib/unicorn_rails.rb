require "unicorn"
require "unicorn/launcher"

module UnicornRails
  require "unicorn_rails/version"
end

module Rack
  module Handler
    class Unicorn
      class << self
        def run(app, options = {})
          unicorn_options = {
            :listeners => ["#{options[:Host]}:#{options[:Port]}"]
          }

          if ::File.exist?("config/unicorn/#{environment}.rb")
            unicorn_options[:config_file] = "config/unicorn/#{environment}.rb"
          elsif ::File.exist?("config/unicorn.rb")
            unicorn_options[:config_file] = "config/unicorn.rb"
          else
            unicorn_options[:timeout] = 31 * 24 * 60 * 60
            unicorn_options[:worker_processes] = (ENV["UNICORN_WORKERS"] || "1").to_i
          end

          if unicorn_options[:config_file]
            if ::File.read(unicorn_options[:config_file]) =~ /^(\s+)listen\s/
              unicorn_options.delete(:listeners)
            end
          end

          ::Unicorn::Launcher.daemonize!(unicorn_options) if options[:daemonize]
          ::Unicorn::HttpServer.new(app, unicorn_options).start.join
        end

        def environment
          ENV["RACK_ENV"] || ENV["RAILS_ENV"]
        end
      end
    end

    register "unicorn", "Rack::Handler::Unicorn"

    def self.default(options = {})
      Rack::Handler::Unicorn
    end
  end
end
