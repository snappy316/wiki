require "test_helper"

feature "Delete a recipe" do
  scenario "signed out user cannot delete a recipe" do
    # Given I am not signed in

    # When I try to delete a recipe
    visit recipes_path
    click_on("Destroy")

    # Then I get an unauthorized message
    page.text.must_include("You are not authorized")
  end

  scenario "signed in user can delete a recipe" do
    # Given I am signed in
    sign_in

    # When I try to delete a recipe
    visit recipes_path
    click_on("Destroy")

    # Then it should not be on the index page any more
    page.text.wont_include("Muffins")
  end
end
