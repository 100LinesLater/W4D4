class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :require_login

    def current_user
        @current_user ||= User.find_by_session_token(session[:session_token])
    end

    def login(user)
        session[:session] = user.reset_session_token!
        @current_user = user
    end

    def logged_in?
        !!current_user
    end

    def require_login
        redirect_to new_session_url unless logged_in?
    end
end
