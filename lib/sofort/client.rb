require 'xmlsimple'
require 'httparty'

module Sofort
  class Client
    include ::HTTParty
    format :xml
    headers 'Accept' => 'application/xml; charset=UTF-8'
    headers 'Content-Type' => 'application/xml; charset=UTF-8'

    def initialize
      @options = {}
      @options[:basic_auth] = {
        username: Sofort.user_id,
        password: Sofort.api_key
      }
      @options[:headers] = {
        'Accept' => 'application/xml',
        'Content-Type' => 'application/xml'
      }
    end

    def pay(amount, name, *args)
      opts = args.extract_options!.symbolize_keys!
      xml = pay_xml(amount, name, opts)
      results = self.class.post(Sofort.base_url,  @options.merge(body: xml))
      results['new_transaction'].present? ? results['new_transaction'] : results
    end

    def details(token)
      xml = details_xml(token)
      results = self.class.post(Sofort.base_url, @options.merge(body: xml))
      transactions = results['transactions']
      if transactions && transactions['transaction_details']
        transactions['transaction_details']
      else
        results
      end
    end

    def details_xml(token)
      <<-eos
      <transaction_request version="2">
      <transaction>#{token}</transaction>
      </transaction_request>
      eos
    end

    def pay_xml(amount, name, opts)
      reason = opts[:reason] || Sofort.reason
      currency_code = opts[:currency_code] || Sofort.currency_code
      country_code = opts[:country_code] ||  Sofort.country_code
      success_url = opts[:success_url] ||  Sofort.success_url
      abort_url = opts[:abort_url] ||  Sofort.abort_url
      email_customer = opts[:email_customer] ||  Sofort.email_customer

      {
        amount: amount,
        currency_code: currency_code,
        reasons: {
          reason: reason
        },
        sender: {
          holder: name,
          country_code: country_code
        },
        email_customer: email_customer,
        notification_emails: {
          notification_email: Sofort.notification_email
        },
        success_url: success_url,
        abort_url: abort_url,
        su: '',
        project_id: Sofort.project_id
      }.to_xml(root: 'multipay', skip_types: true, dasherize: false)
      
    end
  end
end
