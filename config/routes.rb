Historiarenato::Application.routes.draw do
  root "pages#home"    
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  
    
  devise_for :users
  
  namespace :admin do
    root "base#index"
    resources :users
  end

  resources :professions

  resources :students

  resources :workshops

  resources :lessons

  resources :years

  resources :book_observations
  
end
