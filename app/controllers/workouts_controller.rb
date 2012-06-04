class WorkoutsController < ApplicationController
  def index
    if params[:filter].eql? "created"
      @workouts = Workout.where(:user_id => current_user.id).paginate(:page => params[:page]).order('created_at DESC')
    elsif params[:filter].eql? "completed"
      @workouts = Workout.where(:id => Score.where(:user_id => current_user.id).pluck(:workout_id)).paginate(:page => params[:page]).order('created_at DESC')
    else
      @workouts = Workout.paginate(:page => params[:page]).order('created_at DESC')
    end
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(params[:workout])
    @workout.user_id = current_user.id
    if @workout.save
      flash[:success] = "Successfully created workout."
      redirect_to @workout
    else
      render :action => 'new'
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update_attributes(params[:workout])
      redirect_to @workout, :notice  => "Successfully updated workout."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to workouts_url, :notice => "Successfully destroyed workout."
  end
end
