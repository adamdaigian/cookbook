class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(params[:ingredient])
  end

  def edit
    @ingredient = Ingredient.new(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])

    if @ingredient.update_attributes(params[:ingredient])
      redirect_to "/recipes/index"
    else
      render :edit
      # In Sinatra, it would be `erb :edit`.
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])

    @ingredient.destroy

    redirect_to "/ingredients/index"
  end

  def show
    @ingredient = Ingredient.find(params[:id]) 
  end

end
