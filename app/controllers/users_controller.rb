class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @guest_user = User.guest
    @posts = @user.posts.page(params[:page]).per(7)
  end

  def new; end
end
