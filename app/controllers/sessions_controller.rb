class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "YOU DID IT!"
      redirect_to questions_path
    else
      flash.now.alert = "Name or Password is wrong as the day is long."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to questions_path, notice: "Logged out."
  end
end
