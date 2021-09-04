class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "投稿成功しました"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "削除に成功しました"
      redirect_to posts_path
    else
      render :show
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :content)
  end
end
