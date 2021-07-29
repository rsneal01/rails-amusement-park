class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        if current_user.admin
            @message = "Show"
        else
            @message = "Go on"
        end
    end

    def show
        # binding.pry
        # @user = User.find(session[:user_id])
        @attraction = Attraction.find_by(id: params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
        if current_user.admin
            @message = "Edit Attraction"
        else
            @message = "Go on this ride"
        end
    end

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(attraction)
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
    end
    
    def update
        
        attraction = Attraction.find_by(id: params[:id])
        attraction.update(attraction_params)
        redirect_to attraction_path(attraction)
    end

    private 
    
    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end


end
