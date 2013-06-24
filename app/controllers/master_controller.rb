class MasterController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin
  before_filter :redir, only: [:edit,:update,:destroy,:show,:new,:create]

  def show; end  
  
  def new; end  
  
  def edit; end  

  def index
    @list = User.order(:admin)		 
  end	

  def report
    @start = params[:startDate] || (Date.today - 7.days)
    @end = params[:endDate] || Date.today

    if params[:ids]
      @time = Timetable.where('user_id in (?)',params[:ids]).includes(:user).order(:user_id)
      @time = @time.where(:date =>  @start..@end)
      @sum = @time.select("user_id,SUM(hours) as summ").group('user_id')
      
      if params[:excel]
        render 'master/report.xls'      
      else if params[:xml]
      	       render 'master/report.xml'
      	   end
      end 
    else
      redirect_to :controller => 'master', :action => 'index'
    end
  
  end 
  
end
