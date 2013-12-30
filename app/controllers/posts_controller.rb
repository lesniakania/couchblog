class PostsController < ApplicationController
  before_filter :load_user
  before_filter :load_post, :only => [:edit, :update, :destroy]

  def index
    @posts = @user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user = @user
    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to user_posts_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path(@user)
  end

  private

  def load_user
    @user = User.find_by_id(params[:user_id])
  end

  def load_post
    @post = Post.find_by_id(params[:id])
  end
end
