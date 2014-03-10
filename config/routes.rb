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

  resources :books
  get 'books/:id/student_observation', to: 'books#students_obs', as: 'student_observation'
  patch '/books/change_students_obs/:id', to: 'books#change_students_obs'

  resources :roles

  resources :disciplines

  resources :servants

  resources :diaries

  resources :student_diaries
  
end
