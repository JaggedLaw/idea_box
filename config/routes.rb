Rails.application.routes.draw do
  resources :categories
  resources :users do
    resources :ideas
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
