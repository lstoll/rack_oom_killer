module Rack
  class OOMKiller
    def initialize(app, options={})
      default_options = {
        :max_mem => 350,
      }
      @app, @options = app, default_options.merge(options)
    end

    def call(env)
      ret = @app.call(env)
      rss_mem = `ps -o rss= -p #{$$}`.to_i
      if rss_mem > @options[:max_mem] * 1024
        puts "Memory usage excedes #{@options[:max_mem]}mb limit, exiting"
        Thread.new do
          `kill -INT #{$$}`
          sleep 10
          `kill -KILL #{$$}`
        end
      end
      ret
    end
  end
end
