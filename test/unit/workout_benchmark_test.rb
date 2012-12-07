require 'test_helper'

class WorkoutBenchmarkTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert WorkoutBenchmark.new.valid?
  end
end
