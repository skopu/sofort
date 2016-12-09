require 'sofort/version'
require 'sofort/client'
require 'active_support/core_ext/array/extract_options'
require 'active_support/core_ext/hash/conversions'
require 'active_support/core_ext/hash/keys'

module Sofort
  VALUES =  [:user_id, :api_key, :base_url, :abort_url,
            :success_url, :notification_url, :email_customer,
            :notification_email, :project_id, :country_code,
            :currency_code, :reason, :language_code,:user_variable]

  VALUES.each do |method|
    class_eval(<<-EOS, __FILE__, __LINE__ + 1)
      @@#{method} = nil unless defined? @@#{method}
      def self.#{method}
        @@#{method}
      end

      @@#{method} = nil unless defined? @@#{method}
      def self.#{method}=(obj)
        @@#{method} = obj
      end
    EOS

  end


  @@user_id = 'sofort_user_id'
  @@api_key = 'api_key'

  @@base_url = "https://api.sofort.com/api/xml"
  @@abort_url = 'abort_url'
  @@success_url = 'success_url'
  @@notification_url = 'notification_url'

  @@email_customer = 'email_customer'
  @@notification_email = 'notification_email'
  @@project_id = 'project_id'
  @@country_code = "DE"
  @@currency_code = "EUR"
  @@reson = "Reason"

  def self.setup
    yield self
  end
end
