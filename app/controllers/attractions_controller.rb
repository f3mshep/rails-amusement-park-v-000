class AttractionsController < ApplicationController

    def index
        redirect_to '/' if !logged_in?
        @current_user = test_user
        @attractions = Attraction.all
    end

    def show
        attraction_setter
        @current_user = test_user
        @ride = Ride.new(user_id: session[:user_id], attraction_id: @attraction.id)
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        #This is where I would use Pundit to check if current user has
        #the rights to create an attraction. However, the tests are highly opinionated,
        #so they don't play nice with devise and pundit.
        my_authorize
        if @attraction.save
            flash[:alert] = "#{@attraction.name} has been created"
            redirect_to @attraction
        else
            render :new
        end
    end

    def edit
        attraction_setter
    end

    def update
        attraction_setter
        my_authorize
        if @attraction.update(attraction_params)
            flash[:alert] = "Changes saved"
            redirect_to @attraction
        else
            render :edit
        end
    end

    private

    def attraction_setter
        @attraction = Attraction.find(params[:id])
    end

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

end

