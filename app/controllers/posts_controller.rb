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
      @user.posts << @post
      @user.save
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
    @user = User.get(params[:user_id])
  end

  def load_post
    @post = Post.by_user_id_and__id.key([params[:user_id], params[:id]]).first
  end
end
