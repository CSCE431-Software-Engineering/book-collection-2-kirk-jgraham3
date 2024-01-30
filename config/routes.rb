Rails.application.routes.draw do
  resources :books do
    member do
      get :delete
    end
  end
  root "books#index"
  
  #match 'about', to: "books#about", via: :get

  # get 'main/index'
  # get 'books/index'
  # get 'books/new'
  # get 'books/edit'
  # get 'books/show'
  # get 'books/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
