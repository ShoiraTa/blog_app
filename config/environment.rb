# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'Shoira', # This is the string literal 'apikey', NOT the ID of your API key
  :password => '<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>', # This is the secret sendgrid API key which was issued during API key creation
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}