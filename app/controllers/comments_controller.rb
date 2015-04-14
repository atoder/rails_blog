class CommentsController < ApplicationController
  before_action :get_post, only: [:create, :destroy]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
 
    redirect_to post_path(@post)
  end

  private
  def get_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
