class UsersController < ApplicationController

    def show
        if !logged_in?
            redirect_to '/'
        end
        @user = User.find(params[:id])
    end

end