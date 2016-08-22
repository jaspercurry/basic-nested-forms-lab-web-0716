class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])


  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
    @recipe.ingredients.build
    @recipe.ingredients.build
    @recipe.ingredients.build
    @recipe.ingredients.build
    @recipe.ingredients.build
    @recipe.ingredients.build
    @recipe.ingredients.build
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(safe_params)
    @recipe.save
    redirect_to @recipe
  end

private

  def safe_params

    p = params.require(:recipe).permit(:title, ingredients_attributes: [ :name, :quantity ])
    p[:ingredients_attributes].delete_if { |k, v| v[:name] == ""}
    p

  end



end
