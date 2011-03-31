require 'sha_header'
require 'rails'

module SHAHeader
  class Railtie < Rails::Railtie
    initializer "sha_header.configure_rails_initialization" do |app|
      app.middleware.use SHAHeader::Middleware
    end
  end
end
