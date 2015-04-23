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

  match 'students/search_for_workshops' => 'students#search_workshops', as: 'search_for_workshops', via: [:get, :post]
  match 'students/search_for_years' => 'students#search_years', as: 'search_for_years', via: [:get, :post]
  match 'students/search_for_observation' => 'students#search_observations', as: 'search_for_observations', via: [:get, :post]
  match 'students/search_general_student' => 'students#search_general', as: 'search_general_student', via: [:get, :post]

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
