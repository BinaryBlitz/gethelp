Rails.application.routes.draw do
  resources :orders
  resources :users
  resources :verification_tokens, only: [:create, :update], param: :token
end
