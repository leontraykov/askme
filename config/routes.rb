Rails.application.routes.draw do
  root to: 'questions#index'

  get 'users/:nickname', to: 'users#show', as: :user
  resources :users, except: %i[index show]
  resource :session, only: %i[new create destroy]

  resources :questions do
    put :hide, on: :member
    patch :hide, on: :member
  end
end
