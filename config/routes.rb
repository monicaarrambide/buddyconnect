Rails.application.routes.draw do
  root to: 'dashboards#show'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end
  resources :comments
  resources :posts
  resources :users
  resources :interests
  resources :profiles
  resources :groups do
    resources :users
  end

  # root 'users#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
