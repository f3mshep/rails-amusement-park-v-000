class UsersController < ApplicationController

    def ride
       new_ride = Ride.create(ride_params)
       flash[:alert] = new_ride.take_ride
       redirect_to user_path(new_ride.user_id)
    end

    def show
        if !logged_in?
            redirect_to '/'
        end
        @user = User.find(params[:id])
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end