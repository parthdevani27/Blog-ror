Rails.application.routes.draw do
  get 'comments/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "articles#index"

  # get "/articles", to: "articles#index"
  # get "/articles/:id",to: "articles#show"
  # get "/articles/new",to: "articles#new"
  # post "/articles",to: "articles#create"
  # get "/articles/:id/edit",to: "articles#edit"
  # patch "/articles/:id",to: "articles#update"
  # get "/articles/:id/delete",to: "articles#destroy"

  resources :articles do
    resources :comments 
  end

end
