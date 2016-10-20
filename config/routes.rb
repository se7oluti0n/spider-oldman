Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]
  delete 'logout' => 'sessions#destroy'
  
  resources :conversations do
    resources :messages
  end

  get "users/show"
  get "signup" => "users#new"
  post "signup" => "users#create"
  root "homes#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
