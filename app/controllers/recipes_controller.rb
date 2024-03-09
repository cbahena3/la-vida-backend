class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render :index
  end
  def show
    @recipe = Recipe.find_by(id: params[:id])
    render :show
  end
  def create
    @recipe = Recipe.create(
      name: params[:name],
      image: params[:image],
      description: params[:description],
      ingredients: params[:ingredients],
      time: params[:time],
      user_id: params[:user_id],
      servings: params[:servings]
    )
    render :show
  end
  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(
      name: params[:name] || @recipe.name ,
      image: params[:image] || @recipe.image ,
      description: params[:description] || @recipe.description ,
      ingredients: params[:ingredients] || @recipe.ingredients ,
      time: params[:time] || @recipe.time ,
      user_id: params[:user_id] || @recipe.user_id ,
      servings: params[:servings] || @recipe.servings
    )
    render :show
  end
  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    render json:{message: "recipe deleted"}
  end
end
