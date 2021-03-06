Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "/dashboard", to: "users#dashboard"
  get "/categories/autocomplete", to: "categories#autocomplete", as: :autocomplete
  get "/search", to: "services#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :services_technicians, only: %i[new create index show edit update]
  resources :categories, only: %i[show index]
  resources :services, only: %i[index show]

  resources :orders, only: %i[index show new create] do
    member do
      get :start_meeting
    end
    resources :reviews, only: %i[new create]
    resources :payments, only: %i[new]
  end
end
