require "test_helper"

feature "Show a recipe" do
  scenario "signed out user can see an individual recipe" do
    visit recipes_path
    click_on("Show")
    page.text.must_include("Muffins")
  end

  scenario "signed in user can see an individual recipe" do
    sign_in
    visit recipes_path
    click_on("Show")
    page.text.must_include("Muffins")
  end
end
