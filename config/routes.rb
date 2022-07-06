Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions do
    put :hide, on: :member
    patch :hide, on: :member
  end

  # put '/questions/:id', to: 'questions#hide'
  # get '/discussions/:id', to: 'discussions#show_comment'
  # post '/questions', to: 'questions#create'
  # patch 'questions/:id', to: 'questions#update'
  # delete 'questions/:id', to: 'questions#update'
end
