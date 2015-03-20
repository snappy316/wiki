require "test_helper"

feature "Edit a recipe" do
  scenario "signed out user cannot edit a recipe" do
    # Given I am not signed in

    # When I try to edit a recipe
    visit recipes_path
    click_on("Edit")

    # Then I should get an unauthorized message
    page.text.must_include("You are not authorized")
  end

  scenario "signed in user can edit a recipe" do
    # Given I am signed in
    sign_in

    # When I try to edit a recipe
    visit recipes_path
    click_on("Edit")

    # Then I should see a form
    page.text.must_include("Editing Recipe")

    # When I submit the edited form
    fill_in("Content", with: "Make marvelous muffins")
    click_on("Update Recipe")

    # Then I should see the edited info
    page.text.must_include("Make marvelous muffins")
  end
end
