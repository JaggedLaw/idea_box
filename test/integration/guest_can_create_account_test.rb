require 'test_helper'

class GuestCanCreateAccountTest < ActionDispatch::IntegrationTest
  test 'guest can register' do
    visit new_user_path

    fill_in "First Name", with: "Json"
    fill_in "Last Name", with: "Jones"
    click_button "Submit"

    assert page.has_content?("Welcome, Json!")
  end

end
