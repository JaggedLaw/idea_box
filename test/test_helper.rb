ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'

class ActiveSupport::TestCase

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def create_user
    @user = User.create(first_name: "Edgar", last_name: "Duran", password: "password")
  end

  def login_user
    create_user
    visit login_path

    fill_in "Username", with: "Edgar"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  def teardown
    reset_session!
  end
end
