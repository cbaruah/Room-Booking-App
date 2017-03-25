# Load the Rails application.
require File.expand_path('../application', __FILE__)
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'cbaruah1321',
    :password => 'Mango@1321',
    :domain => 'https://library-application1.herokuapp.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}
