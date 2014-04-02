Rails.application.routes.draw do

  root "application#index"

  resources :tickets do
    resources :pictures
  end

  get '/tickets', to: 'tickets#index'



  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'



end
