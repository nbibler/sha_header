require 'spec_helper'

describe SHAHeader::Middleware do
  let(:parent_app) {lambda { |env| [200, {'Content-Type' => 'text/plain'}, ['Hello']] }}
  let(:middleware) { SHAHeader::Middleware.new(parent_app) }
  let(:env) { Rack::MockRequest.env_for('/hello') }

  context 'the X-Git-SHA response header' do
    subject { middleware.call(env)[1]['X-Git-SHA'] }

    it 'is added' do
      should be_present
    end

    context 'on Heroku' do
      before(:each) { ENV['COMMIT_HASH'] = 'ABCDEFG'; ENV['HEROKU_UPID'] = '1' }
      after(:each) { ENV['COMMIT_HASH'] = ENV['HEROKU_UPID'] = nil }

      it { should == 'ABCDEFG' }
    end

    context 'with a REVISION file', :fakefs do
      use_fakefs(self) do
        let(:path) { Rails.root.join('REVISION') }
        before(:each) { File.open(path, 'w') { |file| file.write 'HIJKLMNO' }}
        after(:each) { File.delete(path) }

        it { should == 'HIJKLMNO' }
      end
    end

    context 'when querying git' do
      it 'returns the current HEAD SHA' do
        middleware.should_receive(:`).
          with(%r{git rev-parse HEAD}).
          and_return('XYZ')
        should == 'XYZ'
      end
    end
  end


  it 'is Rack::Lint compliant' do
    app = Rack::Lint.new(middleware)
    app.call(env)
  end
end
