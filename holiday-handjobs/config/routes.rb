Rails.application.routes.draw do

  # site routes
  root to: "site#index"
  get "/about", to: "site#about"
  get "/vendors", to: "site#vendors"
  get "/location", to: "site#location"
  get "/media", to: "site#media"
  get "/contact", to: "site#contact"
  get "/previous_vendors", to: "site#previous_vendors"

  # vendor login/logout
  get "/signup", to: "users#new"
  # post "/users", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  # resources :sessions, only: [:new, :create, :destroy]  
  resources :users

end

#    Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         site#index
#     about GET    /about(.:format)          site#about
#   vendors GET    /vendors(.:format)        site#vendors
#  location GET    /location(.:format)       site#location
#     media GET    /media(.:format)          site#media
#   contact GET    /contact(.:format)        site#contact
#    signup GET    /signup(.:format)         users#new
#     login GET    /login(.:format)          sessions#new
#           POST   /login(.:format)          sessions#create
#    logout GET    /logout(.:format)         sessions#destroy
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy