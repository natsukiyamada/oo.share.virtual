class HomesController < ApplicationController
  skip_before_action :login_required
  def index
  	if signed_in?
      reset_session
    end
  end
end
