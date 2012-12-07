require 'test_helper'

class WorkoutBenchmarksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => WorkoutBenchmark.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    WorkoutBenchmark.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    WorkoutBenchmark.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to workout_benchmark_url(assigns(:workout_benchmark))
  end

  def test_edit
    get :edit, :id => WorkoutBenchmark.first
    assert_template 'edit'
  end

  def test_update_invalid
    WorkoutBenchmark.any_instance.stubs(:valid?).returns(false)
    put :update, :id => WorkoutBenchmark.first
    assert_template 'edit'
  end

  def test_update_valid
    WorkoutBenchmark.any_instance.stubs(:valid?).returns(true)
    put :update, :id => WorkoutBenchmark.first
    assert_redirected_to workout_benchmark_url(assigns(:workout_benchmark))
  end

  def test_destroy
    workout_benchmark = WorkoutBenchmark.first
    delete :destroy, :id => workout_benchmark
    assert_redirected_to workout_benchmarks_url
    assert !WorkoutBenchmark.exists?(workout_benchmark.id)
  end
end
