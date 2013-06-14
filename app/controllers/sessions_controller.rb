class SessionsController < ApplicationController
  skip_before_filter :require_authentication

  def new
  end

  def create
  	user = User.find_by_email(params[:email])

  if user && user.authentication(params[:password])
  	session[:user_id] = user.user_id
  	redirect_to root_path, :notice => "Congrats! You logged in dawg."
  else
  	flash.now[:alet] = "Dawg, you email or password ain't corrent. You sure you got that right?"
  	render :new
  end
end


def destroy
  	session[:user_id] = nil
  	redirect_to root_path, :notice => "Aight then, you just logged out"
 end
end