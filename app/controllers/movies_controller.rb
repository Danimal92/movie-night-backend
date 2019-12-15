
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
        similar_movies = movie.similar_items.map(&:similarity)
        render :json => similar_movies

    end




    def create
        user = User.find(params[:user_id])
        user.save
        render :json => movie
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





