lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'suricate/version'

Gem::Specification.new do |spec|
  spec.name          = 'suricate'
  spec.version       = Suricate::VERSION
  spec.authors       = ['Aurélien AMILIN']
  spec.email         = ['aurelien.amilin@gmail.com']
  spec.summary       = %q{Suricate aims to be an application template for building dashboards.}
  spec.homepage      = "https://github.com/holinnn/suricate"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z -- lib/`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_dependency 'sinatra', '~> 1.4'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'byebug', '~> 5.0'
  spec.add_development_dependency 'rack-test', '~> 0.6.3'
  spec.add_development_dependency 'simplecov', '~> 0.10.0'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.7'
end
