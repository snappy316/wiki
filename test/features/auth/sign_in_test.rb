require "test_helper"

feature "Sign In" do
  scenario "user can sign in" do
    visit new_user_session_path
    fill_in("Email", with: users(:editor).email)
    fill_in("Password", with: "password")
    click_on("Log in")
    page.text.must_include("Signed in successfully")
  end
end
