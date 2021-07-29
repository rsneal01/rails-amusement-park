class RidesController < ApplicationController

    # def new
    #     @ride = Ride.new
    # end

    def create
        ride = Ride.create(ride_params)
        # ride.go_on_ride
        flash.notice = ride.take_ride
        ride.user.save
        # binding.pry
        redirect_to user_path(ride.user)
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end


end