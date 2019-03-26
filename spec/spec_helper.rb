# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sha_header'

Dir[File.expand_path('../support/*.rb', __FILE__)].each { |f| require f }
