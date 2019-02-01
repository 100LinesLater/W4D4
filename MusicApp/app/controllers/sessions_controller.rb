class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:pasword])

        if user 
            login(user)
            # redirect_to session_url
        else
            flash.now[:errors] = "OH NO, something is broken"
            render :new
        end
    end

    def destroy
        @current_user.reset_session_token!
        session[:session_token] = nil
        render :new
    end
end