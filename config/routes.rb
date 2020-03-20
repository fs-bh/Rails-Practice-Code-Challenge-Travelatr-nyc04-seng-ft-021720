Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # standard REST routes
  resources :bloggers
  resources :posts
  resources :destinations
  
  # like a post
  patch '/posts/:id/add_like', to: 'posts#add_like', as: 'add_like'

end