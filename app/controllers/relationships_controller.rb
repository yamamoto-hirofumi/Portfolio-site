class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    #@user = User.find(params[:followed_id])
    #binding.pry
    #urrent_user.follow(params[:user_id])
    @user = current_user.follow(params[:user_id])
    # follow = @user.new(user_id: current_user.id)

    #@user.save
    # current_user.follow(params[:user_id])

    # @book = Book.find(params[:book_id])
    # favorite = @book.favorites.new(user_id: current_user.id)
    # favorite.save



    #redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    #redirect_to request.referer
  end

  def followings
    #binding.pry
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    #binding.pry
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
