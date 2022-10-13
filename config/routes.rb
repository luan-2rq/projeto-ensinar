Rails.application.routes.draw do
  resources :close_ended_questions
  resources :classrooms
  resources :exams
  devise_for :users, path: 'users' , :controllers => {:registrations => "registrations"} 

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    authenticated :user do
      root 'exams#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
