require 'test_helper'

class AUserCanLoginTest < ActionDispatch::IntegrationTest
  test 'a user can login' do
    create_user
    visit login_path

    fill_in "Username", with: "Edgar"
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content? "Welcome Edgar"
end
end
