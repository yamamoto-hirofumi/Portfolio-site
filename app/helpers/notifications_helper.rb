module NotificationsHelper

  def notification_form(notification)
    @visiter = notification.visiter
    @comment = nil

    case notification.action
      when "follow" then
        tag.a(notification.visiter.name, href:user_path(@visiter))+"さんがあなたをフォローしました"
      when "favorite" then
        tag.a(notification.visiter.name, href:user_path(@visiter))+"さんが"+tag.a('あなたの投稿', href:post_path(notification.post_id))+"にいいねしました"
      when "comment" then
        @comment = Comment.find_by(id: notification.comment_id)&.content
        tag.a(@visiter.name, href:user_path(@visiter))+"さんが"+tag.a('あなたの投稿', href:post_path(notification.post_id))+"にコメントしました"
    end
  end
end
