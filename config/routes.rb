Rails.application.routes.draw do
  #get 'privacy_news/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root to: "privacy_news#index"
   
  resources :privacy_news, only: [:index, :create, :destroy]
end
