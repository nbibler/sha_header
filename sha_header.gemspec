# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'sha_header/version'

Gem::Specification.new do |s|
  s.name        = 'sha_header'
  s.version     = SHAHeader::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Nathaniel Bibler']
  s.email       = ['gem@nathanielbibler.com']
  s.homepage    = 'https://github.com/nbibler/sha_header'
  s.summary     = %q{Add a header to the response of your Rails 3 application containing the current commit SHA.}
  s.description = %q{This library adds a new, custom X-Git-SHA header to your Rails 3 application's response which contains the SHA hash that your application is currently running.}

  s.rubyforge_project = 'sha_header'

  s.add_dependency 'railties', '~>3.0'

  s.add_development_dependency 'rspec', '~>2.5.0'
  s.add_development_dependency 'fakefs', '~>0.3.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
