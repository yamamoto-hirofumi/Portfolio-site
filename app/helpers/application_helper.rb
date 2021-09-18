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
  # ログインしたらカウント上がる
  def continuous_login
      while current_user.login_histories.count == 30 do
        if  user_signed_in?
          current_user.login_histories.count + 1
        end
      end
  end
end

