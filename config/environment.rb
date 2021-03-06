# Load the Rails application.
require_relative 'application'
require 'dotenv'

Dotenv.load('.env')

# Initialize the Rails application.
Rails.application.initialize!

#ActionMailer::Base.smtp_settings = {
 # :user_name => ENV['GMAIL_LOGIN'],
  #:password => ENV['GMAIL_PWD'],
  #:domain => 'citoyens-producteurs.fr',
 # :address => 'gmail.com',
# :port => 587,
# :authentication => :plain,
 # :enable_starttls_auto => true
#}

ActionMailer::Base.smtp_settings =   {
    :address            => 'smtp.sendgrid.net',
    :port               => 587,
    :authentication     => :plain,
    :user_name          => ENV['SENDGRID_LOGIN'],
    :password           => ENV['SENDGRID_KEY']
  }