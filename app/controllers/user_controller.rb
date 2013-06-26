class UserController < ApplicationController
  before_filter :authenticate_user!, except: [:help]
  before_filter :find_user, only: [:edit,:update,:destroy,:time]
  before_filter :redir, only: [:show,:new,:create,:index]
  
  def show; end  
  
  def index; end  
  
  def new; end  
  
  def edit; end  

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "User #{@user.name} updated"
      redirect_to controller: 'master', action: 'index'
    else
      render action: "edit"
    end
    rescue Exception => e
      flash[:notice] = e.message
    redirect_to controller: 'master', action: 'index'
  end

  def destroy
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted"
      rescue Exception => e
        flash[:notice] = e.message
      redirect_to controller: 'master', action: 'index'
  end
  
  def time
    @start = params[:startDate] || (Date.today - 7.days)
    @end = params[:endDate] || Date.today
    @time = Timetable.where(user_id: @user.id).where(:date =>  @start..@end)
  end

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

  def help; end

end
