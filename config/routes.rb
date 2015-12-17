Rails.application.routes.draw do
  resource :user, only: [:show, :create, :destroy]

  resources :orders do
    resources :messages, shallow: true
  end
  resources :verification_tokens, only: [:create, :update], param: :token
end
