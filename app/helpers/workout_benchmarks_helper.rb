module WorkoutBenchmarksHelper
  def workout_benchmark_name(workout_benchmark)
    workout_benchmark.workout.name.empty? ? workout_benchmark.workout.created_at.to_s(:long) : workout_benchmark.workout.name
  end

  def has_recent_scores?(user, workout_benchmark)
    user.my_recent_scores(workout_benchmark.workout).count.eql? 0
  end

  def has_scores?(user, workout_benchmark)
    user.my_scores(workout_benchmark.workout).count.eql? 0
  end
end
