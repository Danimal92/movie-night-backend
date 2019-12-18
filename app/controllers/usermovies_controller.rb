class UsermoviesController < ApplicationController

    def show
        usermovie = Usermovie.find(params[:id])
        render :json => usermovie
    end

    def new
        usermovie = Usermovie.new()

    
    end

    def index 
        usermovies = Usermovie.all
        render :json => usermovies
    end

    def create
        usermovie = Usermovie.new(set_param)
        if usermovie.save
            render :json => usermovie
        end
    end


    def destroy
        usermovie = Usermovie.find_by(user_id: params[:user_id], movie_id: params[:movie_id])
        # byebug
        usermovie.destroy
    end

    private

    def set_param
        params.require(:usermovie).permit(:user_id,:liked,:movie_id)
    end
    
end
