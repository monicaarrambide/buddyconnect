Rails.application.routes.draw do
  resources :interests
  resources :comments
  resources :posts

  resources :users do 
    collection do
      get :affinity_matching
    end
  end

  resources :profiles
  resources :groups

  root 'users#index'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
