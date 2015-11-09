require 'test_helper'

class UserCanLogoutTest < ActionDispatch::IntegrationTest
  test 'logged in user can logout' do
    login_user
    visit user_ideas_path(@user)

    click_link "Logout"
    refute page.has_content?("Welcome, Edgar")

  end
end
