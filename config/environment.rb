# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# set environment to production, if not set locally
ENV['RAILS_ENV'] ||= 'production'