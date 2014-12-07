require "sofort/version"
require 'xmlsimple'

module Sofort
  class Client
    include HTTParty
    format :xml
    headers 'Accept' => 'application/xml; charset=UTF-8'#opts[:format_header]
    headers 'Content-Type' => 'application/xml; charset=UTF-8'#opts[:format_header]

    def initialize
      @base_uri = 'https://api.sofort.com/api/xml'
      auth = { username: APP_CONFIG['sofort']['user_id'], password: APP_CONFIG['sofort']['api_key']}
      @options = {}
      @options[:basic_auth]= auth
      @options[:headers] =  {"Accept"=>"application/xml", "Content-Type"=>"application/xml"}  
    end

    def pay(amount, name, url, cbo_number, currency_code, country_code)
      abort_url = "#{APP_CONFIG['url']}/sofort/cancel"
      hash = { amount: amount, currency_code: currency_code, reasons: { reason: "#{cbo_number} - #{Rails.env.to_s}" }, 
        sender: { holder: name, country_code: country_code }, email_customer: 'sebastian.skopp@gmail.com', notification_emails: 
        { notification_email: 'sebastian.skopp@gmail.com' }, success_url: url, abort_url: abort_url, su: "", project_id: APP_CONFIG['sofort']['project_id'] }
      xml = hash.to_xml(root: 'multipay', skip_types: true, dasherize: false)
      results = self.class.post(APP_CONFIG['sofort']['base_url'],  @options.merge(body: xml))
      results['new_transaction'].present? ? results['new_transaction']  : results
    end
    
    def details(token)
      xml = <<-eos
      <transaction_request version="2">
      <transaction>#{token}</transaction>
      </transaction_request>
      eos
      results = self.class.post(APP_CONFIG['sofort']['base_url'],  @options.merge(body: xml))
      (results['transactions'] && results['transactions']['transaction_details']) ? results['transactions']['transaction_details'] : results
    end
  end
end
