class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to @post.recipient }
        format.js { render @post}
      end
    else
      redirect_to :back, notice: "Post is empty"
    end
  end

  def update
    if @post.update(post_params)
      redirect_to current_user
    end
  end

  def destroy
    respond_to do |format|
      if @post.destroy
        format.html {redirect_to :back}
        format.js
      else
        redirect_to :back
      end
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:sender_id, :recipient_id, :content)
    end
end
