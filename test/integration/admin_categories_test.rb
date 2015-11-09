require "test_helper"

class AdminCategoriesTest < ActionDispatch::IntegrationTest

  test 'logged in admin sees categories index' do
    admin = User.create(first_name: "Daisy",
                        last_name: "Dukes",
                        password: "password",
                        role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    assert page.has_content?("Welcome to Category Index")

  end

  test 'default user does not see admin categories index' do
    admin = User.create(first_name: "Daisy",
                        last_name: "Dukes",
                        password: "password",
                        role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(@user)
    visit admin_categories_path
    refute page.has_content?("Welcome to Category Index")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

end
