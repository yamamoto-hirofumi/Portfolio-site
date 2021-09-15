class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :count_login_history

  def after_sign_in_path_for(resource)
    posts_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  private

  def count_login_history
    if current_user
      if current_user.login_histories.present?
        unless current_user.login_histories.last.logind_at.to_date == Date.today
          current_userlogin_histories.create(logind_at: DateTime.now)
        end
      else
        current_user.login_histories.create(logind_at: DateTime.now)
      end
    end
  end
end
