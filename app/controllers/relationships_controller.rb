class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      redirect_to check_profile_mypage_profile_path(@user)
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to check_profile_mypage_profile_path(@user)
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      redirect_to check_profile_mypage_profile_path(@user)
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to check_profile_mypage_profile_path(@user)
    end
  end

  private

  def set_user
    @user = User.find(params[:follower])
  end
end
