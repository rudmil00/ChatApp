Rails.application.routes.draw do
 root 'chatsoba#index'
  get 'login', to: 'sesija#login'
  post 'login', to: 'sesija#create'
  delete 'logout', to: 'sesija#destroy'
  get 'signup', to: 'users#registracija'

  post 'signup', to: 'users#create'
  # pre je bilo resources :users, except: [:registracija]


  post 'message', to: 'messages#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount ActionCable.server, at:'/cable'
end
