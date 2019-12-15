class Movie < ApplicationRecord
    has_many :usermovies
    has_many :users, through: :usermovies
    validates :imdbID, uniqueness: true 

    include SimpleRecommender::Recommendable
    similar_by :users

end
