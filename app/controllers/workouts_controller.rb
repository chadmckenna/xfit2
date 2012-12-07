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
    @scores = (!params[:filter].eql?('mine') ? @workout.scores : @workout.user_scores(current_user))
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(params[:workout])
    @workout.user_id = current_user.id
    if @workout.save
      if params[:benchmark].eql? "1"
        @benchmark = WorkoutBenchmark.new({ :workout_id => @workout.id, :user_id => @workout.user_id })
        if @benchmark.save
          flash[:success] = "Successfully created new benchmark workout."
          redirect_to workout_benchmark_path(@benchmark) and return
        else
          flash[:error] = "Could not save as a benchmark workout."
          render :action => 'new'
        end
      end
      flash[:success] = "Successfully created workout."
      redirect_to @workout and return
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
