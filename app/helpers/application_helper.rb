module ApplicationHelper
  def login_history_image
    if current_user.login_histories.count < 10
      image_tag(asset_path("login_count_image3"), size: '100x40')
    elsif current_user.login_histories.count < 20
      image_tag(asset_path("login_count_image2"), size: '100x40')
    else
      image_tag(asset_path("login_count_image1"), size: '100x40')
    end
  end
end

