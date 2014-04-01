Rails.application.routes.draw do

  root "application#index"

  resources :tickets

  get '/tickets', to: 'tickets#index'



  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'



end
