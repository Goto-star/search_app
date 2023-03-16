class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comments = @post.comments.page(params[:page]).per(7)

    if @comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy
    post = Post.find(params[:post_id])

    @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to post_path(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
