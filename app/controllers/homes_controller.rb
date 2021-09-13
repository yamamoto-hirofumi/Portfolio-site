class HomesController < ApplicationController
  def top
    @post_favorite_ranks = Post.ranking
  end

  def about
  end
end
