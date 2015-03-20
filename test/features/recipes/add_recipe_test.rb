require "test_helper"

feature "Add Recipe" do
  scenario "signed out user cannot add a recipe" do
    # Given I am not signed in

    # When I visit the "add recipe" page
    visit new_recipe_path

    # Then I get an unauthorized error
    page.text.must_include("You are not authorized")
  end

  scenario "signed in user can add a recipe" do
    # Given I am signed in
    sign_in

    # When I visit the "add recipe" page
    visit new_recipe_path

    # Then I can see the form
    page.text.must_include("New Recipe")

    # When I fill out the form and hit submit
    fill_in("Name", with: "Cookies")
    fill_in("Content", with: "Cook cookies")
    click_on("Create Recipe")

    # Then I should see the recipe on the page
    page.text.must_include("Cook cookies")
  end
end
