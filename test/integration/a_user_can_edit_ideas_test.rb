require 'test_helper'

class AUserCanEditIdeasTest < ActionDispatch::IntegrationTest
  test 'a user can edit ideas' do
    create_user
    visit login_path
    login_user
    visit new_user_idea_path(@user)
    fill_in "Name", with: "Greatest Idea!"
    fill_in "Description", with: "This is the greatest idea ever thought up!!"
    click_button "Submit Idea"
    click_link "Show"
    click_link "Edit"
    fill_in "Name", with: "Even Greater Idea!"
    fill_in "Description", with: "I changed my mind this idea is better!!"
    click_button "Save Changes"

    assert page.has_content? "Even Greater Idea!"
    assert page.has_content? "I changed my mind this idea is better!!"

  end
end
