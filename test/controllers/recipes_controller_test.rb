require "test_helper"

class RecipesControllerTest < ActionController::TestCase

  def recipe
    @recipe ||= recipes :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:recipes)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Recipe.count') do
      post :create, recipe: { content: recipe.content, name: recipe.name }
    end

    assert_redirected_to recipe_path(assigns(:recipe))
  end

  def test_show
    get :show, id: recipe
    assert_response :success
  end

  def test_edit
    get :edit, id: recipe
    assert_response :success
  end

  def test_update
    put :update, id: recipe, recipe: { content: recipe.content, name: recipe.name }
    assert_redirected_to recipe_path(assigns(:recipe))
  end

  def test_destroy
    assert_difference('Recipe.count', -1) do
      delete :destroy, id: recipe
    end

    assert_redirected_to recipes_path
  end
end
