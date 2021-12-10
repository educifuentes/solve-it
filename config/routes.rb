Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/pages/autocomplete", to: "pages#autocomplete", as: :autocomplete
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :services_technicians, only: %i[new create]
end
