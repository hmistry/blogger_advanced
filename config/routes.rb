JsbloggerCodemash::Application.routes.draw do
  resources :pages


  resources :articles
  resources :comments
  resource  :dashboard
  resource  :account, :only => [:show] do
    get :work
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/:id' => 'pages#show'

  root to: 'dashboard#show'
end
