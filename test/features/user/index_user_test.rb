require "test_helper"

feature "Index of Users" do
  scenario "signed out user can see the index of users" do
    visit users_path
    page.text.must_include("Editor")
  end

  scenario "signed in user can see the index of users" do
    sign_in
    visit users_path
    page.text.must_include("Editor")
  end
end
