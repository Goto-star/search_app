class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user, only: [:destroy, :edit, :update]
  before_action :set_q, only: [:index, :search]

  def index
    @user = current_user
    @guest_user = User.guest
    @posts = Post.all.page(params[:page]).per(7)
  end

  def show
    @post = Post.find(params[:id])
    @guest_user = User.guest
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    @post.rate = 0.0 if @post.rate.blank?

    if @post.save
      flash[:notice] = "口コミを投稿しました"
      redirect_to posts_path
    else
      render "new"
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "口コミを編集しました"
      redirect_to posts_path
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "口コミを削除しました"
    redirect_to posts_path
  end

  def search
    @results = @q.result
  end

  def history
    @user = current_user
    @posts = @user.posts.page(params[:page]).per(7)
  end

  private

  def post_params
    params.require(:post).permit(:title, :place, :rate, :impression, :place_image)
  end

  def set_q
    @q = Post.ransack(params[:q])
  end

  def ensure_user
    @posts = current_user.posts
    @post = @posts.find_by(params[:id])
    redirect_to posts_path unless @post
  end
end
