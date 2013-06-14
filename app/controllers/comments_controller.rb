class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(params[:comment])
  end

  def edit
    @comment = Comment.new(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(params[:comment])
      redirect_to "/recipes/index"
    else
      render :edit
      # In Sinatra, it would be `erb :edit`.
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to "/comment/index"
  end

  def show
    @comment = Comment.find(params[:id])
  end

end
