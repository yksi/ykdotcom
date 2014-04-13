class UsersController < ApplicationController
  before_action :find_user, except: :index

  def index
  end

  def follow
    current_user.follow!(@user)
    redirect_to :back
  end

  def follow
    current_user.unfollow!(@user)
  end

  def show
    @post = Post.new
    @message = Message.new
  end

  def update
    @user.update_attributes(user_params)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :email, :password, :pasword_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
