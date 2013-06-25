class HomeController < ApplicationController

  def index
    if user_signed_in? and current_user[:admin]
      redirect_to controller: 'master', action: 'index'
    else
      if user_signed_in?
        redirect_to controller: 'timetables', action: 'index'
      else
        redirect_to new_user_session_path
      end
    end
  end

end
