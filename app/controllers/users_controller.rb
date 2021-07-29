class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    # before_action :is_logged_in? 

    def new
        @user = User.new
    end

    def create
        if (user = User.create(user_params))
            session[:user_id] = user.id
            redirect_to user_path(user)
          else
            render 'new'
          end
        # if @user = User.create(user_params)
        #     session[:user_id] = @user.id
        #     redirect_to user_path(@user)
        # else
        #     redirect_to 'root'
        # end
    end

    def show
        # binding.pry
        @user = User.find_by(id: params[:id])
        if @user.admin == true
            @admin = "ADMIN"
        end
        # @user = User.find(params[:id])
        # if session[:user_id] != @user.id
        #     redirect_to 'root'
        # elsif @user.admin == true
        #     @admin = "ADMIN"
        # end
        # binding.pry
        # @attraction = Attraction.find(params[:attraction_id])
        # @user.tickets = @user.tickets - @attraction.tickets
        # if @attraction.happiness_rating < @attraction.nausea_rating
        #     @user.happiness = 0
        # end
        # @user.save
        # binding.pry
        
    end

    # def update
    #     # should we consolidate all of this into the show action?
    #     @user = User.find(params[:id])
    #     @attraction = Attraction.find(params[:attraction_id])
    #     @user.tickets = @user.tickets - @attraction.tickets
    #     if @attraction.happiness_rating < @attraction.nausea_rating
    #         @user.happiness = 0
    #     end
    #     @user.save
    #        binding.pry
    #     redirect_to user_path(@user)
    # end

    
    def user_params
        params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end

end
