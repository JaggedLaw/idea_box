Rails.application.routes.draw do
  resources :categories
  resources :ideas
  resources :users do
    resources :ideas
  end
end
