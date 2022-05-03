Rails.application.routes.draw do
  resources :customers do 
    collection do 
      get :newest_customer
    end
  end
  get 'welcome/index'

  root to: 'welcome#index'

  resources :companies, only: [:show, :index]

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
