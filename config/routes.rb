Rails.application.routes.draw do
  devise_for :users
  root to:"tweets#index"
  delete 'tweets/:id' => 'tweets#destroy'

  resources :tweets, only: %i(new create)
end
