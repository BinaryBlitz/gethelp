Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations

  root 'web/pages#home'

  get 'admin' => 'admin/orders#index'
  get 'signup' => 'web/verification_tokens#new'
  delete 'signout' => 'web/sessions#destroy'

  namespace :web do
    resources :verification_tokens, param: :token
    resources :deposits, only: [:index]
    resources :orders
    resource :user, only: [:show]
  end

  namespace :admin do
    resources :orders do
      patch :reject, on: :member

      resources :messages, only: [:create]
    end
  end

  scope '/robokassa' do
    post 'paid', 'success', 'fail', controller: 'robokassa'
  end

  resource :user, only: [:show, :create, :destroy]
  resources :orders, only: [:show, :index, :create, :update] do
    resources :messages, shallow: true
    resources :payments, only: [:create]
  end
  resources :verification_tokens, only: [:create, :update], param: :token
end
