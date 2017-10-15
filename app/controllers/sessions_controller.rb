class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user == nil
      @error = "Invalid username or password"
      render 'new'
    else
      p session[:user_id]
      session[:user_id] = user.id
      p session[:user_id]

      redirect_to posts_path
    end
  end

  def destroy
    session.clear
    redirect_to posts_path
  end
end
