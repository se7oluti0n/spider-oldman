Rails.application.routes.draw do

  resources :users do
    resources :friendships, shallow: true
    resources :messages, shallow: true
  end

  get "list_sent_messages" => 'messages#list_sent_messages'
  resources :sessions, only: [:new, :create]
  delete 'logout' => 'sessions#destroy'

  get "signup" => "users#new"
  post "signup" => "users#create"
  root "homes#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
