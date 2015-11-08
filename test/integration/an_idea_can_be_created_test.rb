require 'test_helper'

class AnIdeaCanBeCreatedTest < ActionDispatch::IntegrationTest
  test 'idea can be created' do
    login_user
    visit new_user_idea_path(@user)
    fill_in "Name", with: "Greatest Idea!"
    fill_in "Description", with: "This is the greatest idea ever thought up!!"
    click_button "Submit Idea"

    assert page.has_content?("Greatest Idea!")
  end



end
