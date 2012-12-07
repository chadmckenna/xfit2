class Score < ActiveRecord::Base
  attr_accessible :workout_id, :score
  belongs_to :workout
  belongs_to :user

  def to_parsed_score
    if self.score =~ /#\d{1,}/
      self.score.match('#\d{1,}')[0].gsub!('#', '')
    else
      self.score
    end
  end
end
