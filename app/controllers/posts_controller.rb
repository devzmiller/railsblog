class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    if session[:user_id]
      @post = Post.new
    else
      redirect_to new_session_path
    end
  end

  def create
    if session[:user_id]
      params.permit!
      @post = Post.new(params[:post])
      @user = User.find(session[:user_id])
      @post.user = @user
      if @post.save
        redirect_to post_path(@post)
      else
        @errors = @post.errors.full_messages
        render 'new'
      end
    else
      redirect_to new_session_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == session[:user_id]
      post.destroy
      redirect_to posts_path
    else
      redirect_to new_session_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id != session[:user_id]
      redirect_to new_session_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.user_id = session[:user_id]
      params.permit!
      @post.update(params[:post])
      redirect_to post_path(@post)
    else
      redirect_to new_session_path
    end
  end
end
