class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

  def top
    @post_favorite_ranks = Post.ranking
  end

  def about
  end
end
