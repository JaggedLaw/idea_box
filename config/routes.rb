Rails.application.routes.draw do
  resources :ideas 
  resources :users do
    resources :ideas
  end
end
