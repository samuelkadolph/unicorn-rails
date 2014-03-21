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
          if ::File.exist?("config/unicorn/#{environment}.rb")
            unicorn_options = {
              :config_file => "config/unicorn/#{environment}.rb"
            }
          else
            unicorn_options = {
              :listeners => ["#{options[:Host]}:#{options[:Port]}"],
              :worker_processes => (ENV["UNICORN_WORKERS"] || "1").to_i,
              :timeout => 31 * 24 * 60 * 60
            }
          end

          ::Unicorn::Launcher.daemonize!(unicorn_options) if options[:daemonize]
          ::Unicorn::HttpServer.new(app, unicorn_options).start.join
        end

        def environment
          ENV['RACK_ENV'] || ENV['RAILS_ENV']
        end
      end
    end

    register "unicorn", "Rack::Handler::Unicorn"

    def self.default(options = {})
      Rack::Handler::Unicorn
    end
  end
end
