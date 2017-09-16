Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations

  root 'web/pages#home'

  get 'admin' => 'admin/orders#index'

  namespace :admin do
    resources :notifications, only: [:index, :create]
    resources :statistics, only: [:index]
    resources :operators, except: [:show]
    resources :callback_requests, only: [:index]
    resources :posts, except: [:show]
    resources :orders do
      patch :reject, :refund, on: :member

      resources :messages, only: [:create]
    end
  end

  namespace :web do
    resources :orders, only: [:new, :create]
    resources :callback_requests, only: [:create]
  end

  scope '/robokassa' do
    post 'paid', 'success', 'fail', controller: 'robokassa'
  end

  resource :user, only: [:show, :create, :update, :destroy]
  resources :orders, only: [:show, :index, :create, :update] do
    resources :messages, shallow: true
    resources :payments, only: [:create]
  end
  resources :posts, only: [:index]
  resources :verification_tokens, only: [:create, :update], param: :token
end
