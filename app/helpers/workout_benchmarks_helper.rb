module WorkoutBenchmarksHelper
  def workout_benchmark_name(workout_benchmark)
    workout_benchmark.workout.name.empty? ? workout_benchmark.workout.created_at.to_s(:long) : workout_benchmark.workout.name
  end
end
