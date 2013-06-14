class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(params[:recipe])
  end

  def edit
    @recipe = Recipe.new(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update_attributes(params[:recipe])
      redirect_to "/recipes/index"
    else
      render :edit
      # In Sinatra, it would be `erb :edit`.
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy

    redirect_to "/recipes/index"
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

end
