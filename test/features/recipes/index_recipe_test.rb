require "test_helper"

feature "Index of recipes" do
  scenario "signed out user can see the index of recipes" do
    visit recipes_path
    page.text.must_include("Muffins")
  end

  scenario "signed in user can see the index of recipes" do
    sign_in
    visit recipes_path
    page.text.must_include("Muffins")
  end
end
