class AttractionsController < ApplicationController
    def index
    end

    def show
        # binding.pry
        @user = User.find(session[:user_id])
        @attraction = Attraction.find(params[:id])
    end

    def update
        @user = User.find(session[:user_id])

    end

end
