class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    if @comment.save
      redirect_to request.referer
    else
      @post = Post.find(params[:post_id])
      @post_comment = PostComment.new
      @favorites = Favorite.where(post_id: @post.id) 
      render "posts/show"
    end
  end

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to request.referer
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
