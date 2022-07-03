Rails.application.routes.draw do
  get 'orders/bought'
  get 'orders/sold'
  resources :listings
  devise_for :users
  root 'pages#home'

  post "listings/:id/order", to: "listings#place_order", as: "place_order"

  get 'orders/success', to: 'orders#success'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/melbourne', to: 'listings#melbourne'
  get '/sydney', to: 'listings#sydney'
  get '/brisbane', to: 'listings#brisbane'
  get '/gold-coast', to: 'listings#goldcoast', as: 'goldcoast'
  get '/perth', to: 'listings#perth'
  get '/adelaide', to: 'listings#adelaide'
  get '/hobart', to: 'listings#hobart'
  get '/geelong', to: 'listings#geelong'
  get 'newcastle', to: 'listings#newcastle'

end
