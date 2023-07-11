Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "cards#index"

   resources :cards, only: [:index, :new, :create] do
    member do
      get 'detail'
    end
  end
  
end
