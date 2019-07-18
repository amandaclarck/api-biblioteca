Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'books', action: :index, to: 'books#index'
  post 'create', action: :create, to: 'books#create'
  get 'show/:id', action: :show, to: 'books#show'
  post 'update', action: :update, to: 'books#update'

end
