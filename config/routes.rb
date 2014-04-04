Rails.application.routes.draw do

  root "application#index"

  resources :tickets do
    resources :pictures
  end

  resources :categories do
    resources :tickets
  end


  resources :categories

  get '/tickets', to: 'tickets#index'
  get '/popular_categories', to: 'categories#popular'

  get '/user_tickets', to: 'tickets#user_index'



  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'



end
