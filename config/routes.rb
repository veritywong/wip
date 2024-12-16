Rails.application.routes.draw do
  root "events#index"

  resources :events

  resources :artists
  resources :collections
  resources :locations

  resources :locations, only: [:none] do
    collection do
      get :search
    end
  end  
  
end
