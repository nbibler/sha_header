$:.unshift(File.expand_path('../', __FILE__))
$:.unshift(File.expand_path('../../lib', __FILE__))

require 'rspec'
require 'rack'
require 'sha_header'

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each do |support|
  require support
end

