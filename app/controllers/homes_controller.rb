class HomesController < ApplicationController
  def top
    @post_favorite_ranks = Post.find(Favorite.group(:post_id).order("count(post_id) desc").limit(3).pluck(:post_id))
  end

  def about
  end
  
  def rank
    @post_favorite_ranks = Post.find(Favorite.group(:post_id).order("count(post_id) desc").pluck(:post_id))
  end
end
