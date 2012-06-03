module WorkoutsHelper
  def new_workout_score_path(workout)
    "/scores/new/#{workout.id}" unless workout.nil?
  end
end
