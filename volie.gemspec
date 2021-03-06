# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'volie/version'

# There's not a lot I can do to shorten this block so rubocop's gonna have to deal
# rubocop:disable Metrics/BlockLength
Gem::Specification.new do |spec|
  spec.name          = 'volie'
  spec.version       = Volie::VERSION
  spec.authors       = ['Andrew Stephenson']
  spec.email         = ['astephenson@t2modus.com']

  spec.summary       = 'Volie Ruby SDK'
  spec.description   = 'A Ruby SDK providing simple integration with the Volie Call Center Software REST API'
  spec.homepage      = 'https://github.com/t2modus/volie'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'fast_blank'
  spec.add_dependency 'http'
  spec.add_dependency 'multi_json'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rb-readline'
  spec.add_development_dependency 'webmock'
end
# rubocop:enable Metrics/BlockLength
