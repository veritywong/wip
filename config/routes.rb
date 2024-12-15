Rails.application.routes.draw do
  root "events#index"

  resources :events do
    collection do
      get :visited_and_new
      post :visited_and_new
    end
  end

  resources :artists
  resources :collections
  resources :galleries

  resources :locations, only: [:none] do
    collection do
      get :search
    end
  end  
  
end
