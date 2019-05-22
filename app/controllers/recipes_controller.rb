class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'Test', quantity: '0')
    @recipe.ingredients.build(name: 'Num', quantity: '0')
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to @recipe
  end

  private

    def recipe_params
      params.require(:recipe).permit(:title, ingredients_attributes: %i[id name quantity])
    end

end
