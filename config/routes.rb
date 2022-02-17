Rails.application.routes.draw do
 root 'chatsoba#index'
  get 'login', to: 'sesija#login'
  post 'login', to: 'sesija#create'
  delete 'logout', to: 'sesija#destroy'

  # mozda treba poruka/message
  post 'message', to: 'messages#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
