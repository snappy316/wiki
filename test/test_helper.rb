ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails"
require "minitest/rails/capybara"


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

def sign_in
  visit new_user_session_path
  fill_in('Email', with: users(:editor).email)
  fill_in('Password', with: "password")
  click_on('Log in')
end
