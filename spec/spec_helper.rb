require 'sofort'
Dir["spec/support/**/*.rb"].each { |f| require File.expand_path(f) }

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)
RSpec.configure do |config|
  config.before(:each) do
    # Stub pay method
    stub_request(:post, "https://sofort_user_id:api_key@api.sofort.com/api/xml").
      with(:body => "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<multipay>\n  <amount>10</amount>\n  <currency_code>EUR</currency_code>\n  <reasons>\n    <reason nil=\"true\"/>\n  </reasons>\n  <sender>\n    <holder>name</holder>\n    <country_code>DE</country_code>\n  </sender>\n  <email_customer>email_customer</email_customer>\n  <notification_emails>\n    <notification_email>notification_email</notification_email>\n  </notification_emails>\n  <success_url>success_url</success_url>\n  <abort_url>abort_url</abort_url>\n  <su></su>\n  <project_id>project_id</project_id>\n</multipay>\n",
           :headers => {'Accept'=>'application/xml', 'Content-Type'=>'application/xml'}).
      to_return(:status => 200, :body => "", :headers => {})
  
    # Stub details method
    stub_request(:post, "https://sofort_user_id:api_key@api.sofort.com/api/xml").
      with(:body => "      <transaction_request version=\"2\">\n      <transaction>token</transaction>\n      </transaction_request>\n",
           :headers => {'Accept'=>'application/xml', 'Content-Type'=>'application/xml'}).
      to_return(:status => 200, :body => "", :headers => {})


  end
end