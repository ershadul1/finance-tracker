Rails.application.routes.draw do
  devise_for :users
  root to: "transactions#index"
  resources :transactions
  resources :groups
end
