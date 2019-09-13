class ApplicationController < ActionController::Base
helper_method :current_user, :signed_in?
before_action :login_required

private

	def current_user
	    if session[:user_id]
		  current_user = current_user || User.find_by(id: session[:user_id])
	    elsif session[:unknown_user_id]
	      current_user = current_user || UnknownUser.find_by(id: session[:unknown_user_id])
	    else
	    end
	end

	def login_required
		redirect_to root_path unless current_user
	end

	def signed_in?
      current_user
    end
end
