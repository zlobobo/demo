class HomeController < ApplicationController

def index
  if user_signed_in? and current_user[:admin]
	redirect_to :controller => 'master', :action => 'index'
  else
  	if user_signed_in?
	  redirect_to :controller => 'timetables', :action => 'index'
	end
  end
end	


end
