$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'rack/oom_killer/version'

Gem::Specification.new do |s|
  s.name        = "rack_oom_killer"
  s.version     = Rack::OOMKiller::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Lincoln Stoll"]
  s.email       = ["lstoll@lstoll.net"]
  s.homepage    = "http://github.com/lstoll/rack_oom_killer"
  s.summary     = "Kills process when using excess memory"
  s.description = "Rack::OOMKiller is a rack middleware that will check the memory usage of the process post-request, and if > 400mb exit"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "rack-ssl-enforcer"

  s.add_development_dependency "bundler",    "~> 1.0"
  s.add_development_dependency "rack",       "~> 1.2.0"

  s.files        = Dir.glob("{lib}/**/*") + %w[LICENCE README.md]
  s.require_path = 'lib'
end