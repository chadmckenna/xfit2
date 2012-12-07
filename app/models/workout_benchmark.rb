class WorkoutBenchmark < ActiveRecord::Base
  attr_accessible :workout_id, :user_id
  belongs_to :user
  belongs_to :workout
end
