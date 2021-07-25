class UsersController < ApplicationController
    before_action :is_logged_in? 

    def new
        @user = User.new
    end

    def create
        if @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to 'root'
        end
    end

    def show
        # binding.pry
        @user = User.find(params[:id])
        # if @user.happiness && @user.nausea
        #     @mood = @user.mood
        # end
        if session[:user_id] != @user.id
            redirect_to 'root'
        elsif @user.admin == true
            @admin = "ADMIN"
        end
        # binding.pry
    end

    def update
        # binding.pry
        @user = User.find(params[:id])
        @attraction = Attraction.find(params[:id])
        # binding.pry
        @user.tickets = @user.tickets - @attraction.tickets
        @user.save
        redirect_to user_path(@user)
    end

    
    def user_params
        params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end

end
