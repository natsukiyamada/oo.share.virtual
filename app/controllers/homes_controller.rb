class HomesController < ApplicationController
  skip_before_action :login_required
  def index
  	#if signed_in?
     #@user = current_user
     #redirect_to user_path(@user)
   #end
  end
end
