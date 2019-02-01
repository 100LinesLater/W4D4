class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
            #redirect to links main page
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end

    end

    def show
        render :show
    end

    private 

    def user_params
        params.require(:users).permit(:email, :password)
    end
    
end