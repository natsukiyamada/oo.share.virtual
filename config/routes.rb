Rails.application.routes.draw do
  
 root to: "homes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :users do
    resources :events, only: [:new, :create, :destroy, :show] 
 end
 
 resources :events, only: [] do
    resources :comments, only: [:create, :destroy]
 end

 resources :comments, only: [] do
    resource :like, only: [:create, :destroy]
 end

 resources :invitations, only: [:new, :create, :destroy]
 
 resources :unknown_users, only: [:create, :destroy]
 

 get '/login', to: "sessions#new"
 post '/login', to: "sessions#create"
 delete "/logout", to: "sessions#destroy"
end

