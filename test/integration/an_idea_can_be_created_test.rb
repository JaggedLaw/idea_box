require 'test_helper'

class AnIdeaCanBeCreatedTest < ActionDispatch::IntegrationTest
  test 'idea can be created' do
    visit new_idea_path

    fill_in "Name", with: "Greatest Idea!"
    fill_in "Description", with: "This is the greatest idea ever thought up!!"
    click_button "Submit Idea"

    assert page.has_content?("Greatest Idea!")
  end

end
