# Sofort

 Gem for use Sofort Api in Ruby. Payments and check details.
 SOFORT Überweisung - Sofort Api Banking https://www.sofort.com/integrationCenter-eng-DE/content/view/full/2513


## Installation

Add this line to your application's Gemfile:

    gem 'sofort'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sofort

## Usage
 generate initializer file(confing/initializers/sofort.rb). You can change a lot of defaults
  ```ruby
  rails g sofort:install
  ```
  init api client
  ```ruby
  client=Sofort::Client.new
  ```
### Example of pay
 you can set more attributes, please look at config/initializers/sofort.rb
  ```ruby
  client.pay(12, 'skopu', { success_url: 'http://google.com', abort_url: 'https://google.com'})
  ```
  ```ruby
=> {"transaction"=>"89043-182942-5490DD29-53B3",
 "payment_url"=>
  "https://www.sofort.com/payment/go/894515b4df08d438eb76320asdasde3383ed72ae80"}
  ```
### Example of details
#### When no results
  ```ruby
  client.details('89043-182942-5490DD29-53B3')
  ```
  ```ruby
=> {"transactions"=>nil}
  ```
#### When results
  ```ruby
  client.details('89043-182942-5490DD29-53B3')
  ```
  ```ruby
=> {"project_id"=>"your project id",
 "transaction"=>"89043-182942-5490DD29-53B3",
 "test"=>"0",
 "time"=>"2014-12-16T17:16:21+01:00",
 "status"=>"untraceable",
 "status_reason"=>"sofort_bank_account_needed",
 "status_modified"=>"2014-12-16T17:16:21+01:00",
 "payment_method"=>"su",
 "language_code"=>"de",
 "amount"=>"42.00",
 "amount_refunded"=>"0.00",
 "currency_code"=>"EUR",
 "reasons"=>{"reason"=>"Order 212"},
 "user_variables"=>nil,
 "sender"=>
  {"holder"=>"Payer Name",
   "account_number"=>"12312312",
   "bank_code"=>"12312312",
   "bank_name"=>"Deutsche Bank AG",
   "bic"=>"DEUTDEDBHAN",
   "iban"=>"DE50250700240444432900",
   "country_code"=>"DE"},
 "recipient"=>
  {"holder"=>"Clean on Demand UG",
   "account_number"=>"12312312",
   "bank_code"=>"12312312",
   "bank_name"=>"Commerzbank AG",
   "bic"=>"C12312312",
   "iban"=>"DE12312312",
   "country_code"=>"DE"},
 "email_customer"=>"your@gmail.com",
 "phone_customer"=>nil,
 "exchange_rate"=>"1.0000",
 "costs"=>{"fees"=>"0.63", "currency_code"=>"EUR", "exchange_rate"=>"1.0000"},
 "su"=>{"consumer_protection"=>"0"},
 "status_history_items"=>
  {"status_history_item"=>
    {"status"=>"untraceable",
     "status_reason"=>"sofort_bank_account_needed",
     "time"=>"2014-12-16T17:16:21+01:00"}}}
  ```
## Contributing

1. Fork it ( https://github.com/skopu/sofort/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
