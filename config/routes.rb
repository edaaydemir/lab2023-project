Rails.application.routes.draw do
  root "cards#index"
  
  resources :cards do
  resources :comments
  end

  get 'login', to: 'login#new', as: 'login'
  post 'login', to: 'login#create'
  delete 'logout', to: 'login#destroy', as: 'logout'

  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'
  
end
