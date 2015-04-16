require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post, "https://api.newrelic.com/deployments.xml").
         to_return(:status => 200, :body => "", :headers => {})
  end
  

end
