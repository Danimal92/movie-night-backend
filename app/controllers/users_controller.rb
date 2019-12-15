class UsersController < ApplicationController

    def index
        users = User.all
        render :json => users
    end

    def show
        user = User.find(params[:id])
        render :json => user
    end

    def create
        user = User.new(set_param)
        if user.save
            render :json => user
        end
    end

    def update
        user = User.find(params[:id])
        user.update(set_param)
        render :json => user
    end


    def get_user_by_email
        # byebug
        user = User.find_by(email: params[:email])
        # byebug
        render :json => user
    end  

    def destroy
        user = User.find(params[:id])
        user.destroy
    end
    



    private

    def set_param
        params.require(:user).permit(:email, :password)
    end


end
