# frozen_string_literal: true

class Mypage::ProfilesController < Mypage::BaseController
  def show
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(profile_params)
      redirect_to mypage_profile_path, success: 'プロフィールを更新しました'
    else
      render :show
    end
  end

  def check_profile
    @user = User.find(params[:id])
  end

  private

  def profile_params
    params.require(:user).permit(:name, :avatar, :email, :hobby, :profile)
  end
end
