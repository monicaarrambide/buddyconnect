Rails.application.routes.draw do
<<<<<<< HEAD
  resources :interests
=======
  root to: 'dashboards#show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  # post '/new', to 'users#new'

>>>>>>> fd78d4313277dcdaaf45bf971bf8e4763dd8ffd4
  resources :comments
  resources :posts

  resources :users do 
    collection do
      get :affinity_matching
    end
  end

  resources :profiles
  resources :groups do
    resources :users
  end

  # root 'users#index'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
