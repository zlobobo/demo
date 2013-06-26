class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def check_admin
    unless current_user[:admin] || params[:id] == current_user.id
      render text: "Access denied", status: 403
    end
  end
  
  def find_user
    @user=User.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:notice] = e.message
      redirect_to controller: 'master', action: 'index'
  end

  def redir
    redirect_to controller: 'master', action: 'index'
  end

end
