Rails.application.routes.draw do
  root "gallery_exhibitions#index"

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

  resources :locations, only: [:none] do
    collection do
      get :search
    end
  end  
  
end
