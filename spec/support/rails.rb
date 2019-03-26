# frozen_string_literal: true

require 'pathname'

module Rails
  def self.root
    Pathname.new(File.expand_path('../../../', __FILE__))
  end
end
