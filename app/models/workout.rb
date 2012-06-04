class Workout < ActiveRecord::Base
  attr_accessible :name, :workout, :user_id
  has_many :scores
  belongs_to :user

  self.per_page = 5

  def user_scores(user)
  	Score.where(:user_id => user.id, :workout_id => self.id)
  end
end
