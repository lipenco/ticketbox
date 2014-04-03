Rails.application.routes.draw do

  root "application#index"

  resources :tickets do
    resources :pictures
  end


  resources :categories

  get '/tickets', to: 'tickets#index'



  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'



end
