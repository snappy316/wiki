class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show
    @users = @recipe.users.all
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.users << current_user

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /recipes/1
  def update
    @recipe.users << current_user unless @recipe.users.include?(current_user)
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :content)
    end
end
