class SearchController < ApplicationController
  def index
    @search = params[:search]
    @workouts = Workout.where( "name like (?)", "%#{@search}%" ).paginate(:page => params[:page]).order('created_at DESC')
  end
end