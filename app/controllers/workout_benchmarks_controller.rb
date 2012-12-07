class WorkoutBenchmarksController < ApplicationController
  def index
    @workout_benchmarks = WorkoutBenchmark.all
  end

  def show
    @workout_benchmark = WorkoutBenchmark.find(params[:id])
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
