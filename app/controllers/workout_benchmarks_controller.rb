class WorkoutBenchmarksController < ApplicationController
  def index
    @workout_benchmarks = WorkoutBenchmark.where( user_id: current_user.id ).paginate(:page => params[:page]).order('created_at DESC')
  end

  def show
    @workout_benchmark = WorkoutBenchmark.find(params[:id])
    @scores = current_user.my_scores(@workout_benchmark.workout)
  end

  def new
    @workout_benchmark = WorkoutBenchmark.new
  end

  def create
    @workout_benchmark = WorkoutBenchmark.new(params[:workout_benchmark])
    if @workout_benchmark.save
      redirect_to @workout_benchmark, :notice => "Successfully created workout benchmark."
    else
      render :action => 'new'
    end
  end

  def destroy
    @workout_benchmark = WorkoutBenchmark.find(params[:id])
    @workout_benchmark.destroy
    redirect_to workout_benchmarks_url, :notice => "Successfully destroyed workout benchmark."
  end
end
