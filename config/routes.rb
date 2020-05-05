Rails.application.routes.draw do
  devise_for :users

  root to:"tweets#index"
  # delete 'tweets/:id' => 'tweets#destroy'
  # get "/tweets/:id/edit" => "tweets#edit"
  # patch "/tweets/:id" => "tweets#update"
  # get "/users/edit" => "registrations#edit"
  # patch "/users" => "registrations#update"


  resources :tweets
  resources :users
end
