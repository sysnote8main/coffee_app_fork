Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/api/test', to: 'application#test'
  resources :beans, only: [:index, :create]
  # post '/beans/create', to: 'beans#create'

end
