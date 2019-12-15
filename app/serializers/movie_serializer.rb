class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :rated, :released, :runtime, :genre, :director, :writer, :actors, :plot, :language, :country, :awards, :poster, :imdbRating, :imdbID, :type, :boxoffice, :production
end
