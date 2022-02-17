Rails.application.routes.draw do
 root 'chatsoba#index'
  get 'login', to: 'sesija#login'
  post 'login', to: 'sesija#create'
  delete 'logout', to: 'sesija#destroy'
   get 'signup', to: 'users#registracija'
  resources :users, except: [:registracija]
  # mozda treba poruka/message
  post 'message', to: 'messages#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount ActionCable.server, at:'/cable'
end
