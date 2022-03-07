Rails.application.routes.draw do
  devise_for :users

  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'

  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  root 'users#index' 
  resources :users, only:  [:index, :show,  ]  do
    resources :posts, only: [:index, :show,:new, :create] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
end
