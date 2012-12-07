class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :workouts
  has_many :workout_benchmarks
  has_many :scores

  def my_scores(workout)
  	workout.user_scores(self)
  end

  def my_recent_scores(workout, count = 0)
  	workout.recent_scores(self, count)
  end
end
