Rails.application.routes.draw do
  get "signup" => "users#new"
  post "signup" => "users#create"
  root "homes#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
