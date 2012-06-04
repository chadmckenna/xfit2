class Score < ActiveRecord::Base
  attr_accessible :workout_id, :score
  belongs_to :workout
  belongs_to :user
end
