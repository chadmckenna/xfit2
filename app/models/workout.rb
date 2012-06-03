class Workout < ActiveRecord::Base
  attr_accessible :name, :workout
  has_many :scores

  self.per_page = 5
end
