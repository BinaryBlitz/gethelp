Rails.application.routes.draw do
  resource :user, only: [:show, :create, :destroy]

  resources :orders
  resources :verification_tokens, only: [:create, :update], param: :token
end
