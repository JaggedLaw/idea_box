require 'test_helper'

class AUserCanViewIndividualIdeasTest < ActionDispatch::IntegrationTest
  test 'a user can view ideas' do
    create_user
    visit login_path
    login_user
    visit new_user_idea_path(@user)
    fill_in "Name", with: "Greatest Idea!"
    fill_in "Description", with: "This is the greatest idea ever thought up!!"
    click_button "Submit Idea"

    click_link "Show"
    assert page.has_content? "Greatest Idea!"
    assert page.has_content? "This is the greatest idea ever thought up!!"

  end
end
