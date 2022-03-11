Rails.application.routes.draw do
  devise_for :users

  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'

  end
  
  root 'users#index' 

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[show] do
        resources :posts, only: %i[index] do
          resources :comments, only: %i[create index]
        end
      end
    end
  end
  
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[create destroy]
      resources :likes, only: %i[create]
    end
  end
end
