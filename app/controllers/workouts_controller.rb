class WorkoutsController < ApplicationController
  def index
    # @workouts = Workout.find(:all, :order => 'created_at DESC')
    @workouts = Workout.paginate(:page => params[:page]).order('created_at DESC')
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(params[:workout])
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
