Sofort.setup do |config|

  config.base_url = "https://api.sofort.com/api/xml"
  config.user_id = 'sofort_user_id'
  config.api_key = 'api_key'
  config.abort_url = 'abort_url'
  config.success_url = 'success_url'
  config.notification_url = 'notification_url'

  config.email_customer = 'email_customer'
  config.notification_email = 'notification_email'
  config.project_id = 'project_id'
  config.country_code = "DE"
  config.currency_code = "EUR"
  config.reason = "Reason"

end
