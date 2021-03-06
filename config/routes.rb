Xfit2::Application.routes.draw do
  resources :workout_benchmarks

  devise_for :users
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
  end

  resources :scores
  match "/scores/new/:workout_id" => 'scores#new'
  resources :workouts do
    get 'to_benchmark', on: :member
  end
  root :to => 'workouts#index'
  resources :search
end
