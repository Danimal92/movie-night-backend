Rails.application.routes.draw do
  resources :follows
  resources :usermovies
  resources :movies
  resources :users

  post 'get_movies_of_user' => 'movies#get_movies_of_user'
  

end
