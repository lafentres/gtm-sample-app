class PostsController < ApplicationController
  before_action :is_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to root_url
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:info] = "Post saved"
      redirect_to post_url(@post)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to post_url(@post)
    else
      render 'edit'
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :description, :category,
                                 :author, :image)
  end


end
