require 'fakefs'

module FakeFS::SpecHelpers
  def use_fakefs
    before(:each) do
      FakeFS.activate!
    end

    after(:each) do
      FakeFS.deactivate!
      FakeFS::FileSystem.clear
    end
  end
end

RSpec.configure do |config|
  config.extend FakeFS::SpecHelpers
end
