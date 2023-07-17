Rails.application.routes.draw do
  root "cards#index"
  resources :cards do
  resources :comments, only: [:create]
  end

  get 'login', to: 'login#new', as: 'login'
  post 'login', to: 'login#create'
  delete 'logout', to: 'login#destroy', as: 'logout'
end
