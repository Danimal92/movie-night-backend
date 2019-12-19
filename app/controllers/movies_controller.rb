require 'omdb/api'
class MoviesController < ApplicationController

    



    def index
        movies = Movie.all
        render :json => movies
    
    end

    def show
        movie = Movie.find(params[:id])
        render :json => movie
    end

    def get_movies_of_user
        usermovies = Usermovie.where(user_id: params[:user_id])
        movies = []
        usermovies.select{|m|
             movies << Movie.find(m.movie_id)}
        # byebug
        render :json => movies
    end

    def get_similar_movies 

        movie = Movie.find(params[:id])
        similar_movies = movie.similar_items(n_results: 3)
        similar_ranks = movie.similar_items.map(&:similarity)
        render :json => similar_movies
        # render :json => similar_ranks
        
    end

    # def search_movies
    #     client = Omdb::Api::Client.new do |config|
    #         config.api_key = 'b345e258'
    #     end

    #     client.search(params[:title])

    # end

    def find_by_imdbID
        movie = Movie.find_by(imdbID: params[:imdbID])
        # byebug
        render :json => movie
    end



    def create
        movie = Movie.new(set_param)
        if movie.save
            render :json => movie
        else
            flash[:message] = "MOVIE IS NOT UNIQUE"
        end
    end

    def destroy
        movie = Movie.find(params[:id])
        Movie.destroy
    end

  
   



    
    
    private

    def set_param
        params.require(:movie).permit(:title,:year,:rated,:released,:runtime,:genre,:director,:writer,:actors,:plot,:language,:country,:awards,:poster,:imdbRating,:imdbID,:type,:boxoffice,:production)
    end

end





