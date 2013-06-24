class UserController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin
  before_filter :find_user, only: [:edit,:update,:destroy,:time]
  before_filter :redir, only: [:show,:new,:create,:index]
  
  def show; end  
  
  def index; end  
  
  def new; end  
  
  def edit; end  

  def update
    begin
      if @user.update_attributes(params[:user])
        flash[:notice] = "User #{@user.name} updated"
        redirect_to :controller => 'master', :action => 'index'
      else
        render action: "edit"
      end
    rescue Exception => e
    flash[:notice] = e.message
    end
    redirect_to :controller => 'master', :action => 'index'
  end

  def destroy
    begin    
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted"
      rescue Exception => e
      flash[:notice] = e.message
    end
    redirect_to :controller => 'master', :action => 'index'
  end
  
  def time
    @start = params[:startDate] || (Date.today - 7.days)
    @end = params[:endDate] || Date.today
    @time = Timetable.where(user_id: @user.id).where(:date =>  @start..@end)
  end 

end
