class CreateWorkoutBenchmarks < ActiveRecord::Migration
  def self.up
    create_table :workout_benchmarks do |t|
      t.integer :workout_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :workout_benchmarks
  end
end
