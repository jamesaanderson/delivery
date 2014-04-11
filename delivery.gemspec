# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delivery/version'

Gem::Specification.new do |spec|
  spec.name          = "delivery"
  spec.version       = Delivery::VERSION
  spec.authors       = ["James A. Anderson"]
  spec.email         = ["me@jamesaanderson.com"]
  spec.description   = %q{A Ruby interface to the Delivery.com API}
  spec.summary       = %q{A Ruby interface to the Delivery.com API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest', '~> 5.3.2'
  spec.add_development_dependency 'webmock', '~> 1.17.4'

  spec.add_dependency 'httparty', '~> 0.13.1'
  spec.add_dependency 'hashie', '~> 2.1.0'
end
