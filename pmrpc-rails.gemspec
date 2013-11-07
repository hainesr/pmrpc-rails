$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pmrpc/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pmrpc-rails"
  s.version     = Pmrpc::Rails::VERSION
  s.authors     = ["Robert Haines"]
  s.email       = ["rhaines@manchester.ac.uk"]
  s.homepage    = "https://github.com/hainesr/pmrpc-rails"
  s.summary     = "Package the Pmrpc HTML5 JavaScript library for the Rails asset pipeline."
  s.description = "Pmrpc (https://github.com/izuzak/pmrpc) is an HTML5 "\
    "JavaScript library for message passing, remote procedure call and "\
    "publish-subscribe cross-contex communication in the browser. The "\
    "library provides a simple API for exposing and calling procedures "\
    "between browser windows, iframes and web workers, even between "\
    "different origins. Pmrpc also provides several advanced features: "\
    "callbacks similar to AJAX calls, ACL-based access control, "\
    "asynchronous procedure support and fault-tolerance via retries. In "\
    "case this wasn't clear, pmrpc is not a library for browser-server "\
    "communication, it is a library for communication within the browser."

  s.files = Dir["{lib,vendor}/**/*"] + ["LICENCE.rdoc", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "railties", ">= 3.1.0"

  s.add_development_dependency "rails", "~> 3.2.14"
  s.add_development_dependency "sqlite3"
end
