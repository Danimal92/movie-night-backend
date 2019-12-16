Rails.application.routes.draw do
  resources :follows
  resources :usermovies
  resources :movies
  resources :users

  post 'get_movies_of_user' => 'movies#get_movies_of_user'
  post 'get_similar_movies' => 'movies#get_similar_movies'
  

end
