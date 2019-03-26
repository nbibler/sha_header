# frozen_string_literal: true

require 'sha_header'
require 'rails'

module SHAHeader
  class Railtie < Rails::Railtie
    initializer 'sha_header.use_rack_middleware' do |app|
      app.middleware.use 'SHAHeader::Middleware'
    end
  end
end
