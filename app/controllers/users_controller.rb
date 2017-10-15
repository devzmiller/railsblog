class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    params.permit!
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end
end
