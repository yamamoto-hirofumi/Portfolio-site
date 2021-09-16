module ApplicationHelper
  def login_history_text
    if current_user.login_histories.count < 10
      image_tag("login_count_image3", size: '100x40')
    elsif current_user.login_histories.count < 20
      image_tag("login_count_image2", size: '100x40')
    else
      image_tag("login_count_image1", size: '100x40')
    end
  end

  def continuous_login
    case current_user.login_histories.where(logind_at: User.created_at..(Time.current))
    when login_histories.count = 10
      alert(count_10)
    when login_histories.count = 20
      alert(count_20)
    when login_histories.count = 30
      alert(count_30)
    end
  end
end
