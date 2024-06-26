Rails.application.routes.draw do
  get 'questions/close_ended', to: 'questions#index_close_ended'
  get 'questions/close_ended/new', to: 'questions#new_close_ended'
  get 'questions/close_ended/:id', to: 'questions#show_close_ended'
  post 'questions/close_ended', to: 'questions#create_close_ended'
  get 'questions/open_ended', to: 'questions#index_open_ended'
  get 'questions/open_ended/new', to: 'questions#new_open_ended'
  get 'questions/open_ended/:id', to: 'questions#show_open_ended'
  post 'questions/open_ended', to: 'questions#create_open_ended'

  resources :questions
  resources :classrooms

  resources :exams
  post '/join-exam', to: 'exams#join_exam'
  post '/exam/:id/start', to: 'exams#start'
  post 'exam/answer-question/:id', to: 'exams#answer_question'
  get 'exam/close-question/:id', to: 'exams#show_close_question', as: 'exam_close_question_answer'
  get 'exam/open-question/:id', to: 'exams#show_open_question', as: 'exam_open_question_answer'
  get 'exam/close-code-popup', to: 'exams#close_code_popup'

  get 'exams/correction/:exam_attempt_id', to: 'exams#show_correction_open_question'
  post 'exams/correction/:exam_attempt_id/question/:question_id', to: 'exams#correct_question'

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
