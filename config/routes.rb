Xfit2::Application.routes.draw do
  resources :scores
  match "/scores/new/:workout_id" => 'scores#new'
  resources :workouts
  root :to => 'workouts#index'
end
