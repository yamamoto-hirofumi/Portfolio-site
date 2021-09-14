class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy
  validates :comment, presence: true

  def create_notification_comment!(current_user)
    current_user.active_notifications.create!(post_id: post.id, post_comment_id: id, visited_id: post.user.id, action: "comment", checked: false)
  end
end
