class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :notifications, dependent: :destroy
  attachment :image
  validates :title, length: { maximum: 50 }, presence: true
  validates :content, length: { maximum: 150 }, presence: true

  def self.ranking
    find(Favorite.group(:post_id).order("count(post_id) desc").limit(3).pluck(:post_id))
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def written_by?(current_user)
    user == current_user
  end

  def save_tags(savepost_tags)
    current_tags = tags.pluck(:name) unless tags.nil?
    old_tags = current_tags - savepost_tags
    new_tags = savepost_tags - current_tags
    # binding.pry
    old_tags.each do |old_name|
      tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name: new_name)
      tags << post_tag
    end
  end

  def create_notification_favorite!(current_user)
    temp = current_user.active_notifications.where(post_id: self, action: 'favorite')
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id, visited_id: user_id, action: "favorite"
      )
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def self.search(keyword)
    where(["title like? OR content like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
