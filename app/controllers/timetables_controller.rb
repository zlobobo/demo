class TimetablesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_time, only: [:edit,:update,:destroy]

  def index
    @timetables = Timetable.where('user_id = ?',current_user.id )
  end

  def show
     if current_user[:admin]
          redirect_to :controller => 'master', :action => 'index'
        else 
          redirect_to timetables_url
        end       
  end

  def new
    @timetable = Timetable.new
    @users = User.order(:admin)
  end

  def edit
    @users = User.order(:admin)
  end

  def create
    @timetable = Timetable.new(params[:timetable])
      if @timetable.save
        if current_user[:admin]
          redirect_to :controller => 'master', :action => 'index', notice: 'Timetable was successfully created.'
        else 
          redirect_to timetables_url, notice: 'Timetable was successfully created.'
        end       
      else
        render action: "new"
      end
    
  end

  def update
      if @timetable.update_attributes(params[:timetable])
        if current_user[:admin]
          redirect_to :controller => 'master', :action => 'index', notice: 'Timetable was successfully updated.'
        else 
          redirect_to timetables_url, notice: 'Timetable was successfully updated.'
        end  
      else
        render action: "edit"
        
      end
    end

  def destroy
    @timetable.destroy
    if current_user[:admin]
      redirect_to :controller => 'master', :action => 'index', notice: 'Timetable was successfully deleted.'
    else 
      redirect_to timetables_url, notice: 'Timetable was successfully deleted.'
    end  
  end

private

  def find_time
    begin
    @timetable=Timetable.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
    flash[:notice] = e.message
    redirect_to :controller => 'timetables', :action => 'index'
    end
    unless @timetable.user_id == current_user.id or current_user[:admin]
      flash[:notice] = "Access Denied"
      redirect_to :controller => 'timetables', :action => 'index'
    end
  end

end
