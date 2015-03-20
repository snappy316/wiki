require "test_helper"

feature "Show a user's profile" do
  scenario "signed out user can see a user's profile" do
    visit user_path(users(:editor).id)
    page.text.must_include("Editor")
  end

  scenario "signed in user can see a user's profile" do
    sign_in
    visit user_path(users(:editor).id)
    page.text.must_include("Editor")
  end
end
