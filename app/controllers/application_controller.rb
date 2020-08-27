class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user 
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end

end
