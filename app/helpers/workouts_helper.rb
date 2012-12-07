module WorkoutsHelper
  def new_workout_score_path(workout)
    "/scores/new/#{workout.id}" unless workout.nil?
  end

  def workout_name(workout)
    workout.name.empty? ? workout.created_at.to_s(:long) : workout.name
  end
end
