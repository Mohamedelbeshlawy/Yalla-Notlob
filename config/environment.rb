# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
    :user_name => 'testdjango2222@gmail.com', # This is the string literal 'apikey', NOT the ID of your API key
    :password => '01023108169', 
    :domain => 'co-orderddd.com',
    :address => 'smtp.gmail.com',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }