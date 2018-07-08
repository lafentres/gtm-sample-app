class LikesController < ApplicationController
  before_action :is_logged_in, only: [:index, :create, :destroy]
  before_action :is_user, only: [:index]

  def create
    @user = current_user
    @post = Post.find(params[:id])

    if @user && @post
      like = Like.where(user_id: @user.id, post_id: @post.id).first
      if like.nil?
        @like = Like.create(user_id: @user.id, post_id: @post.id)
      end
    end

    if @like
      respond_to do |format|
        format.js { render layout: false }
      end
    else
      head :no_content
    end
  end

  def destroy
    @user = current_user
    @post = Post.find(params[:id])

    if @user && @post
      @like = Like.where(user_id: @user.id, post_id: @post.id).first
      if @like
        @like.destroy
      end
    end

    if @like
      respond_to do |format|
        format.js { render layout: false }
      end
    else
      head :no_content
    end
  end
end
