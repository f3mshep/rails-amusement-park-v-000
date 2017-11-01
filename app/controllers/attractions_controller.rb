class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find(params[:id])
        @ride = Ride.new(user_id: session[:user_id], attraction_id: @attraction.id)

    end

end
