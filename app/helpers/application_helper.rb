module ApplicationHelper
  def login_history_text
    if current_user.login_histories.count < 2
      "凡人"
    elsif current_user.login_histories.count < 3
      "普通"
    else
      "達人"
    end
  end
end
