Rails.application.routes.draw do
  root 'web/pages#home'

  namespace :web do
    resources :verification_tokens, param: :token
    resource :user, only: [:show]
  end

  resource :user, only: [:show, :create, :destroy]
  resources :orders, only: [:index, :create, :update] do
    resources :messages, shallow: true
  end
  resources :verification_tokens, only: [:create, :update], param: :token
end
