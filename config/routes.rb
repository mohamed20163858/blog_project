Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "users#index"
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "posts#index"
  get "/users/:id/posts/:id", to: "posts#show"
  get "/posts/new", to: "posts#new" # use id=1 to enable only current user to create posts
  post "/posts", to: "posts#create" 
  post "/comments", to:"comments#create"
  post "/likes", to:"likes#create"
  # Defines the root path route ("/")
  # root "articles#index"
end
