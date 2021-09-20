# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  
  # after_action :count_login_history
  # after_action :continuous_login
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  # private
  
  # # 連続ログインで動くメソッド
  # def continuous_login
  #   #array_desc = current_user.login_histories.order(logind_at: "desc")
  #   #array_asc = current_user.login_histories.order(logind_at: "asc")
  #   if current_user
  #     first_day = ""
  #     #　ログインした日を遡りループ処理を行う
  #     current_user.login_histories.order(logind_at: "desc").each_with_index do |login_history, index|
  #       # ログインした日を取得し一番古いログイン日＝ログインした一番新しい日なら
  #     if current_user.login_histories.order(logind_at: "desc").last.logind_at.to_date == login_history.logind_at.to_date
  #       first_day = login_history.logind_at.to_date
  #       break
  #     end
  #     # ログインした一番新しい日ー１つ前のログインした日を取得して１より大きければ
  #       if (login_history.logind_at.to_date - current_user.login_histories.order(logind_at: "desc")[index+1].logind_at.to_date).to_int > 1
  #         first_day = login_history.logind_at.to_date
  #         break
  #       end
  #     end

  #     num = 1
  #     # first_dayから今日までのlogind_atをループさせる
  #     current_user.login_histories.where(logind_at: first_day..current_user.login_histories.order(logind_at: "asc").last.logind_at).order(logind_at: "asc").each_with_index do |login_history, index|
  #       # ログインした日を取得し最後の日とログインした最新の日が同じなら
  #       if current_user.login_histories.order(logind_at: "asc").last.logind_at.to_date == login_history.logind_at.to_date
  #       break
  #       end
        
  #       if (current_user.login_histories.order(logind_at: "asc")[index+1].logind_at.to_date - login_history.logind_at.to_date).to_int == 1
  #         num += 1
  #       end
  #     end
  #     #binding.pry
  #     flash[:notice]  = num.to_s + "日連続ログインおめでとうございます！！"
  #   end
  # end

  # # ログイン記録を作成する
  # def count_login_history
  #   if current_user
  #     if current_user.login_histories.present?
  #       # 再ログインしても記録されない
  #       unless current_user.login_histories.order(logind_at: "asc").last.logind_at.to_date == Date.today
  #         current_user.login_histories.create(logind_at: DateTime.now)
  #       end
  #     else
  #       current_user.login_histories.create(logind_at: DateTime.now)
  #     end
  #   end
  # end
end
