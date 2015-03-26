Rails.application.routes.draw do
  resources :authentications
  get '/auth/:provider/callback', to: 'authentications#create'
  get 'auth/failure', to: redirect('/')
  match "signout", to: 'authentications#destroy', as: 'signout', via: :delete
  
  
  # devise_for :users
  
 
  resources :posts do
  	member do
  		get "like", to: "posts#upvote"
  		get "dislike", to: "posts#downvote"
  	end
  	resources :comments
  end

  root 'posts#index'

end
