class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    params.permit!
    @post = Post.new(params[:post])
    if @post.save
      redirect_to post_path(@post)
    else
      @errors = @post.errors.full_messages
      render 'new'
    end
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to posts_path
  end
end
