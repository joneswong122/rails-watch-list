Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: [:index, :new, :show, :create]

  resources :lists do
    resources :bookmarks, only: [:new, :show, :create, :destroy]
  end
  get "/movies", to: "movies#index"
end
