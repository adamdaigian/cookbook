require "open-uri"



 def new
    @recipe = Recipe.new
  end

def create
    # Only work if user is logged in.
    @recipe = Recipe.new(params[:recipe])

    if @recipe.new

    recipe_content = Nokogiri::HTML(open("http://www.simplyrecipes.com/recipes/ingredient/#{@recipe.title}"))

    recipe_content = recipe_content.css("#recipe-method p")[0].recipe_content

    @recipe.content = recipe_content

    @twilio_client.account.sms.messeges.create(
    	:from => '',
    	:to => '+14142502780',
    	:body => "#{@recipe.title} recipe added with 'Simply Recipes'."
      )
	end
  end
end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update_attributes(params[:recipe])
      redirect_to "/recipes/show/.id"
    else
      render :edit
      # In Sinatra, it would be `erb :edit`.
    end
 end



