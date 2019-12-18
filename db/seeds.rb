
require 'faker'
require 'omdb/api'
require 'simple_recommender'

Usermovie.destroy_all
User.destroy_all
Movie.destroy_all



client = Omdb::Api::Client.new do |config|
    config.api_key = 'b345e258'
end

50.times do 
    User.create(email: Faker::Internet.unique.email, password: '1')
end

75.times do 
    movie = client.find_by_title(Faker::Creature::Animal.unique.name, type: 'movie', plot: 'full')
    # byebug
    imdbIDS = []
    Movie.all.each{|m| imdbIDS << m.imdbID}
    if movie && !imdbIDS.include?(movie.imdb_id) 
        Movie.create(title: movie.title, year: movie.year, rated: movie.rated, released: movie.released , runtime: movie.runtime, genre: movie.genre , director: movie.director, writer: movie.writer, actors: movie.actors, plot: movie.plot, language: movie.language, country: movie.country, awards: movie.awards, poster: movie.poster, imdbRating: movie.imdb_rating, imdbID: movie.imdb_id, boxoffice: movie.box_office)
    end
end

500.times do 
    Usermovie.create(liked: true, user_id: rand(1..50), movie_id: rand(1..100))
end




