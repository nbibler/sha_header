# coding: utf-8
# frozen_string_literal: true


lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sha_header/version'

Gem::Specification.new do |spec|
  spec.name          = 'sha_header'
  spec.version       = SHAHeader::VERSION
  spec.authors       = ['Nathaniel Bibler']
  spec.email         = ['gem@nathanielbibler.com']

  spec.summary       = 'Add a header to the response of your Rails application containing the current commit SHA.'
  spec.description   = "This library adds a new, custom X-Git-SHA header to your Rails application's response which contains the SHA hash that your application is currently running."
  spec.homepage      = 'https://github.com/nbibler/sha_header'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'railties', '>= 3.2', '< 5.3'

  spec.add_development_dependency 'appraisal', '~> 2.0'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'fakefs', '~>0.4', '>= 0.4.3'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
