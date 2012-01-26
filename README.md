# Rack OOM Killer

Post-request, will check the memory usage of the process and if it exceeds the configured amount (default 350m), exit. Try and exit nicely initially, after 10 seconds kill the process

## Usage

Rails 3.x:

Gemfile:

gem "rack_oom_killer"

In application.rb

    # max_mem optional
    config.middleware.use = Rack::OOMKiller, :max_mem => 200

Sinatra: 

Require and load gem as appropriate

    # max_mem is optional
    use Rack::OOMKiller, :max_mem => 200

## Caveats

Note, this executes *after* the request has been processed - if a single request blows out the memory usage too much, this isn't going to handle that.

Only tested on Linux and Mac. Highly unlikely to work on Windows.
