Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :exhibitions do
    collection do
      get :visited_and_new
      post :visited_and_new
    end
  end

  resources :gallery_exhibitions do
    member do 
      get :schedule
      post :schedule
    end
  end

  resources :artists
  resources :collections
  resources :activities
  resources :galleries
  root "gallery_exhibitions#index"
  
end
