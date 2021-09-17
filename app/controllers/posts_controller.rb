class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
    @tags = Tag.all
    @tag_ranks = Tag.tag_ranking
  end

  def show
    @post = Post.find(params[:id])
    @comment = PostComment.new
    @favorites = Favorite.where(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_ids].split(",")
    if tag_list.present? && @post.save
      @post.save_tags(tag_list)
      flash[:notice] = "投稿成功しました"
      redirect_to posts_path
    else
      flash[:error] = "タグを入れてください"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(",")
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:tag_ids].split(",")
    if tag_list.present? && @post.update(post_params)
      @post.save_tags(tag_list)
      flash[:notice] = "更新できました"
      redirect_to post_path(@post)
    else
      flash[:error] = "タグを入れてください"
      render :edit
    end
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

  def search
    if params[:keyword].present?
      @posts = Post.search(params[:keyword]).page(params[:page]).per(10)
      @keyword = params[:keyword]
    else
      @posts = Post.all.page(params[:page]).per(10)
    end
  end

  def tag_index
    @posts = Post.where(tag_id: params[:tag_id]).page(params[:page]).per(10)
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :content)
  end
end
