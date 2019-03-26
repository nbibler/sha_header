# frozen_string_literal: true

require 'active_support/core_ext/object/blank'

module SHAHeader
  class Middleware
    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      @app.call(env).tap do |response|
        response[1]['X-Git-SHA'] = current_git_sha
      end
    end


    private


    def on_heroku?
      ENV['HEROKU_UPID'].present?
    end

    def revision_present?
      ::Rails.root.join('REVISION').exist?
    end

    def current_git_sha
      @current_git_sha ||= begin
        if revision_present?
          File.read(::Rails.root.join('REVISION')).strip
        elsif on_heroku?
          ENV['COMMIT_HASH'].strip
        else
          `cd "#{::Rails.root}" && git rev-parse HEAD 2>/dev/null`.strip
        end
      end
    end
  end
end
