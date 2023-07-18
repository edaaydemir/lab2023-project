class LoginController < ApplicationController
    def new
        @user = User.new
    end
  
    def create
      user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged is succesfully!'
      else
        flash.now[:alert] = 'Invalid email or password!'
        render 'new' , status: :unprocessable_entity
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged out is succesfully!'
    end
  end
  