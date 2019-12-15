class UsermoviesController < ApplicationController

    def show
        usermovie = Usermovie.find(params[:id])
        render :json => usermovie
    end

    def create
        usermovie = Usermovie.new(set_param)
        if usermovie.save
            render :json => usermovie
        end
    end


    def destroy
        usermovie = Usermovie.find(params[:id])
        usermovie.destroy
    end
    
end
