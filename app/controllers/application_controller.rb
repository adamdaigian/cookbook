class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_authentication
  before_filter :setup_twilio_client

  def current_user
      if session[:user_id]
        @current_user = User.find(session[:user_id])
      end
    end
    helper_method :current_user
  end

  def require_authentication
    if current_user.nil?
      redirect_to root_path :alert => "Dawg, you need to be logged in!"
  	end

end

  def setup_twilio_client
    if @twilio_client.nil?
		@twilio_client = Twilio::REST::Client.new(
		account_sid = 'ACc470d2edc2cb48e85ed9dea68270db7b'
		auth_token = '{{ 8054f891d8bcba28e205774970d6066f }}')
	end
  end
end






