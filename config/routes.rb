Rails.application.routes.draw do
  resources :categories
  resources :users do
    resources :ideas
  end

  namespace :admin do
    resources :categories
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
