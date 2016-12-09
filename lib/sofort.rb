require 'sofort/version'
require 'sofort/client'

module Sofort

  mattr_accessor :user_id
  mattr_accessor :api_key
  mattr_accessor :base_url
  mattr_accessor :abort_url
  mattr_accessor :success_url
  mattr_accessor :notification_url
  mattr_accessor :email_customer
  mattr_accessor :notification_email
  mattr_accessor :project_id
  mattr_accessor :country_code
  mattr_accessor :currency_code
  mattr_accessor :reason
  mattr_accessor :language_code
  mattr_accessor :user_variable
  
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
