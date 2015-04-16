# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'newrelic_deployment/version'

Gem::Specification.new do |spec|
  spec.name          = "newrelic_deployment"
  spec.version       = NewrelicDeployment::VERSION
  spec.authors       = ["Elliot Hursh"]
  spec.email         = ["elliot.hursh@sportngin.com"]
  spec.summary       = %q{Records Deployment in Newrelic}
  spec.description   = %q{Records Deployment in Newrelic}
  spec.homepage      = "https://github.com/sportngin/newrelic_deployement"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0.0.beta2"
  spec.add_development_dependency "webmock", "~> 1.21"
end
