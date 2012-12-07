class Workout < ActiveRecord::Base
  attr_accessible :name, :workout, :user_id
  has_many :scores
  has_many :benchmark_workouts
  belongs_to :user

  self.per_page = 5

  def user_scores(user)
  	Score.where(:user_id => user.id, :workout_id => self.id)
  end

  def recent_scores(user, count)
  	if count.eql? 0
  		Score.where(:user_id => user.id, :workout_id => self.id).order("created_at DESC")
  	else
  		Score.where(:user_id => user.id, :workout_id => self.id).order("created_at DESC").limit(count)
  	end
  end
end
