Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions

  # get '/discussions/:id', to: 'discussions#show_comment'
  # post '/questions', to: 'questions#create'
  # patch 'questions/:id', to: 'questions#update'
  # delete 'questions/:id', to: 'questions#update'
end
