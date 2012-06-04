class ScoresController < ApplicationController
  def show
    @score = Score.find(params[:id])
  end

  def new
    @score = Score.new
    if params[:workout_id].nil?
      redirect_to root_url, :error => "Could not find workout" if @workout.nil?
    else
      @workout = Workout.find(params[:workout_id])
    end
  end

  def create
    @score = Score.new(params[:score])
    @score.user_id = current_user.id
    if @score.save
      flash[:success] = "Successfully created score."
      redirect_to workout_path(@score.workout_id)
    else
      render :action => 'new'
    end
  end

  def destroy
    @score = Score.find(params[:id])
    @score.destroy
    redirect_to scores_url, :notice => "Successfully destroyed score."
  end
end
