Rails.application.routes.draw do
  
  devise_for :users
  
  root 'movies#index'
  
  resources :movies do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
  end
  
end
