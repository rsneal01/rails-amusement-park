class SessionsController < ApplicationController
    before_action :is_logged_in?

    def new
        @user = User.new
    end

    def create
        # binding.pry
        if @user = User.find_by(name: params[:user][:name])
        # binding.pry
        # params[:user][:password] != nil && params[:user][:password] == @user.password
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to 'root'
        end
    end

    def destroy
        session[:user_id] = nil     
        redirect_to 'root' 
    end
    
end