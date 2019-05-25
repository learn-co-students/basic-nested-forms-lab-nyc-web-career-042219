class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
     @recipe.ingredients.build(quantity: '', name: '')
     @recipe.ingredients.build(quantity: '', name: '')
     # @recipe.ingredients.build()

  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.valid?
      @recipe.save
    else
      render :new
    end

  end

private

  def recipe_params
    params.require(:recipe).permit(:title,
    ingredients_attributes: [
      :quantity,
      :name
    ]
  )
  end
end
